import os
import cbor
import cbor2

cborpath=os.path.dirname(cbor.__file__)
cbor2path=os.path.dirname(cbor2.__file__)


print ("cbor.file is <" + cborpath + ">")
print ("cbor2.file is <" + cbor2path + ">")
