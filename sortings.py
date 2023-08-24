def bubblesort(mstr):
    mstr_list = list((mstr))
    bsl = []
    for i in range(len(mstr_list)):
        for j in range(0,len(mstr_list)-i-1):
            if ord(mstr_list[j]) > ord(mstr_list[j+1]):
                mstr_list[j], mstr_list[j+1] = mstr_list[j+1], mstr_list[j]
    for i in mstr_list:
        if i not in bsl:
            bsl.append(i)
    return ','.join(bsl)

def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[0]
    left = [i for i in arr if i < pivot]
    right = [x for x in arr if x > pivot]
    return  quicksort(left) + [pivot] + quicksort(right)

def main():
    import time
    mstr = input("Input the text")
    mstr_list = list(mstr)
    start_b = time.time()
    print("Bubble sorting result ",bubblesort(mstr_list))
    finish_b = time.time()
    print("time for bubble sorting =",finish_b - start_b)
    start_q = time.time()
    print("quick sorting result ",quicksort(mstr_list))
    finish_q = time.time()
    print("Time for quick sorting =",finish_q - start_q)
main()
