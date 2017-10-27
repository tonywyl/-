import rsa
import base64

pub_key_obj,priv_key_obj=rsa.newkeys(256)
#pub_key_obj, priv_key_obj = rsa.newkeys(256)

pub_key_str=pub_key_obj.save_pkcs1()#pub_key_str = pub_key_obj.save_pkcs1()
pub_key_code=base64.standard_b64decode(pub_key_str)#pub_key_code = base64.standard_b64encode(pub_key_str)

priv_key_str=priv_key_obj.save_pkcs1()#priv_key_str = priv_key_obj.save_pkcs1()
priv_key_code=base64.standard_b64decode(priv_key_str)#priv_key_code = base64.standard_b64encode(priv_key_str)


print(pub_key_code)
print(priv_key_code)

def encrypt(value):
    key_str=base64.standard_b64decode(pub_key_code)#key_str = base64.standard_b64decode(pub_key_code)
    pk=rsa.PublicKey.load_pkcs1(key_str)#pk = rsa.PublicKey.load_pkcs1(key_str)
    val=rsa.encrypt(value.encode('utf-8'),pk)#val = rsa.encrypt(value.encode('utf-8'), pk)
    return val

def decrypt(value):
    key_str=base64.standard_b64decode(priv_key_code)
    pk=rsa.PrivateKey.load_pkcs1(key_str)
    val=rsa.decrypt(value,pk)
    return  val

if __name__ == '__main__':
    v='hahah'
    v1=encrypt(v)
    print(v1)
    v2=decrypt(v1)
    print(v2)




