#selected sort 
ml=list(map(int,input().split()))
newl=[]
for i in ml:
    while len(ml)>0:
        a=min(ml)
        newl.append(a)
        ml.remove(a)
print(*newl)
