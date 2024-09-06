//
//  MusicPlayerManager.swift
//  MusicPlayControl
//
//  Created by Chang Woo Son on 8/7/24.
//

import Foundation
import MediaPlayer
import MusicKit

public final actor MusicPlayerManager: ObservableObject {
    @MainActor private let player = ApplicationMusicPlayer.shared

    @Published @MainActor public private(set) var isPlaying: Bool = false

    @MainActor
    public init() {
        setupRemoteCommandCenter()
    }

    @Published @MainActor public private(set) var album: Album?
    @Published @MainActor public private(set) var currentTrack: Track?
    @MainActor private var tracks: [Track] = []
}

public extension MusicPlayerManager {
    @MainActor var title: String {
        currentTrack?.title ?? ""
    }

    @MainActor var artistName: String {
        album?.artistName ?? ""
    }

    @MainActor var artworkURL: URL? {
        album?.artwork?.url(width: 200, height: 200)
    }

    @MainActor var isShuffled: Bool {
        player.state.shuffleMode == .songs
    }

    @MainActor var repeatMode: MusicKit.MusicPlayer.RepeatMode? {
        player.state.repeatMode
    }
}

public extension MusicPlayerManager {
    @MainActor
    func play(albumId: String, trackId: String? = nil, isShuffled: Bool) {
        Task(priority: .high) {
            do {
                try await fetchAlubumInfo(by: albumId)
                var selectedTrack: Track?
                if let trackId {
                    selectedTrack = tracks.first(where: { $0.id.rawValue == trackId })
                }
                player.pause()
                player.queue = ApplicationMusicPlayer.Queue(for: tracks, startingAt: selectedTrack)
                try await player.prepareToPlay()
                try await player.play()
                updateNowPlayingInfo(with: player.queue.currentEntry)
                player.state.shuffleMode = isShuffled ? .songs : .off
                isPlaying = true
            } catch {
                print(error.localizedDescription)
            }
        }
    }


    @MainActor
    func resume() {
        Task {
            do {
                try await player.play()
                isPlaying = true
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @MainActor
    func pause() {
        player.pause()
        isPlaying = false
    }

    @MainActor
    func next() {
        Task {
            try await player.skipToNextEntry()
            try await Task.sleep(for: .seconds(1))
            updateNowPlayingInfo(with: player.queue.currentEntry)
        }
    }

    @MainActor
    func previous() {
        Task {
            try await player.skipToPreviousEntry()
            try await Task.sleep(for: .seconds(1))
            updateNowPlayingInfo(with: player.queue.currentEntry)
        }
    }

    @MainActor
    func toggleShuffled() {
        player.state.shuffleMode = isShuffled ? .off : .songs
        objectWillChange.send()
    }

    @MainActor
    func toggleRepeatMode() {
        switch player.state.repeatMode {
        case .all:
            player.state.repeatMode = .none
        case .one:
            player.state.repeatMode = .all
        default:
            player.state.repeatMode = .one
        }
        objectWillChange.send()
    }
}

private extension MusicPlayerManager {

    @MainActor
    func setupRemoteCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()

        commandCenter.playCommand.addTarget { [weak self] _ in
            print("--woody--")
            self?.resume()
            return .success
        }

        commandCenter.pauseCommand.addTarget { [weak self] _ in
            print("--woody-- pause")
            self?.pause()
            return .success
        }

        commandCenter.nextTrackCommand.addTarget { [weak self] _ in
            self?.next()
            return .success
        }

        commandCenter.previousTrackCommand.addTarget { [weak self] _ in
            self?.previous()
            return .success
        }
    }

    @MainActor
    func updateNowPlayingInfo(with track: MusicKit.MusicPlayer.Queue.Entry?) {
        guard let track = tracks.first(where: { track?.title == $0.title }) else { return }
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = track.title
        nowPlayingInfo[MPMediaItemPropertyArtist] = track.artistName
        nowPlayingInfo[MPMediaItemPropertyPlaybackDuration] = track.duration
        nowPlayingInfo[MPNowPlayingInfoPropertyElapsedPlaybackTime] = 0

        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        self.currentTrack = track
    }

    @MainActor
    func fetchAlubumInfo(by albumId: String) async throws {
        let request = MusicLibraryRequest<Album>()
        let albums = try await request.response().items
        guard let album = albums.first(where:{ $0.id.rawValue == albumId }) else { return }
        let tracks = try await album.with(.tracks).tracks
        self.album = album
        self.tracks = tracks?.map { $0 } ?? []
    }
}

