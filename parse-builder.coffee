fs          = require ('fs')
path        = require('path')
boardBuilder = require('svgerber-board-builder')

layers = []
for filename in process.argv[2..]
    layers.push
        filename: path.basename(filename)
        gerber:fs.readFileSync(filename, 'utf8')

svg = boardBuilder(layers)
