require 'cutorch'

t1 = cutorch.getDeviceProperties(cutorch.getDevice())
print( t1 )
