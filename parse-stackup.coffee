fs           = require('fs')
boardBuilder = require('svgerber-board-builder')
pcbStackup   = require('pcb-stackup')
idLayer      = require('pcb-stackup/lib/layer-types').identify
gerberToSvg  = require('gerber-to-svg')

layers = []
for filename in process.argv[2..]
    gerberString = fs.readFileSync(filename, 'utf-8')
    layerType    = idLayer(filename)
    options      = {object: true, drill: (layerType == 'drl')}
    svgObj       = gerberToSvg(gerberString, options)
    layers.push({type: layerType, svg: svgObj})

stackup = pcbStackup(layers, 'test')
