refresh:
	tuist clean
	tuist install
	make sync

sync:
	tuist generate --no-open
	make gen
	open Delightroom.xcworkspace

gen:
	needle generate App/Sources/Common/NeedleGenerated.swift ./
