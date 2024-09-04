tuist graph -t -d -f dot
sed -i '' '/Example/d' graph.dot
dot -Tpng graph.dot -o Resources/graph.png
rm graph.dot
open Resources/graph.png
