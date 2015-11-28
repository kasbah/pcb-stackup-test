fs           = require('fs')
boardBuilder = require('svgerber-board-builder')
pcbStackup   = require('pcb-stackup')
idLayer      = require('pcb-stackup/lib/layer-types').identify
gerberToSvg  = require('gerber-to-svg')

layers = []
for filename in process.argv[2..]
    gerberString = fs.readFileSync(filename, 'utf-8')
    layerType    = idLayer(filename)
    if layerType != 'drw' #drw is the default for any un-identifiable extensions
        try
            svgObj = gerberToSvg(gerberString, {object: true, drill: (layerType == 'drl')})
        catch
            try
                svgObj = gerberToSvg(gerberString, {object: true, drill: true})
            catch e
                console.warn "could not parse #{filename} as #{layerType} because #{e.message}"
                continue
            layerType = 'drl'
        layers.push({type: layerType, svg: svgObj})

stackup = pcbStackup(layers, 'test')
