fs                  = require ('fs')
path                = require('path')
stackupBoardBuilder = require('./stackupBoardBuilder')
gerberToSvg         = require('gerber-to-svg')

stackup = stackupBoardBuilder(process.argv[3..])

fs.writeFileSync("output/#{path.relative('gerbers', process.argv[2])}-top.svg", gerberToSvg(stackup.top))
fs.writeFileSync("output/#{path.relative('gerbers', process.argv[2])}-bottom.svg", gerberToSvg(stackup.bottom))
