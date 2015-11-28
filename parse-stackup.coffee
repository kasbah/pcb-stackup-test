fs                  = require ('fs')
path                = require('path')
stackupBoardBuilder = require('./stackupBoardBuilder')
gerberToSvg         = require('gerber-to-svg')

stackup = stackupBoardBuilder(process.argv[3..])

fs.writeFileSync("output/#{path.relative('gerbers', process.argv[2])}.svg", gerberToSvg(stackup.top))
