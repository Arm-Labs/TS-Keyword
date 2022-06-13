import os
import cbor
import cbor2
import sys


cborpath=os.path.dirname(cbor.__file__)
cbor2path=os.path.dirname(cbor2.__file__)

for p in sys.path: print (p)

print ("cbor.file is <" + cborpath + ">")
print ("cbor2.file is <" + cbor2path + ">")

os.environ['PYTHONPATH'].split(os.pathset)