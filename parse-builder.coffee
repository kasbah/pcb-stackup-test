fs          = require ('fs')
path        = require('path')
boardBuilder = require('svgerber-board-builder')
gerberToSvg  = require('gerber-to-svg')

layers = []
for filename in process.argv[3..]
    layers.push
        filename: path.basename(filename)
        gerber:fs.readFileSync(filename, 'utf8')

svg = boardBuilder(layers)
fs.writeFileSync("output/#{path.relative('gerbers',process.argv[2])}.svg", svg.top)
