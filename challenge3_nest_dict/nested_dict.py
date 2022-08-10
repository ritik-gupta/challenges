from munch import DefaultMunch

def get_val(obj, k):
    converted_obj = DefaultMunch.fromDict(obj)
    return converted_obj[k]
    

if __name__ == "__main__":
    print(get_val({'a': 1, 'b': {'c': 2}, 'd': ["hi", {'foo': "bar"}]}, 'a'))

# d = {'x':{'y':{'z':'a'}}}
# converted_obj = DefaultMunch.fromDict(d)
# print(converted_obj.x.y.z)