class collat:
    def __init__(self,num):
        self.num = num
        
        while num != 1:
            if num % 2==0:
                num/=2
                print(num)
            else:
                num=(num*3)+1
                print(num)
collat(3)

