##  顺序表

```c
#include <stdio.h>
#include <malloc.h>

#define MaxSize 50
typedef int ElemType;


typedef struct {
    ElemType data[MaxSize];     //存放顺序表元素
    int length;                 //存放顺序表的长度
} SqList;                       //顺序表的类型定义



//建立顺序表
void CreateList(SqList &L, ElemType a[], int n) {
    int i;
    L = *(SqList *) malloc(sizeof(SqList));
    for (i = 0; i < n; i++)
        L.data[i] = a[i];
    L.length = n;
}

/*
 * 初始化
 */
void InitList(SqList &L) {
    L = *(SqList *) malloc(sizeof(SqList));    //分配存放线性表的空间
    L.length = 0;
}

/*
 * 销毁
 */
void DestroyList(SqList &L) {
    free(&L);
}

/*
 * 清空
 */
bool ListEmpty(SqList *L) {
    return (L->length == 0);
}

/*
 * 求长度
 */
int ListLength(SqList *L) {
    return (L->length);
}

/*
 * 输出
 */
void DispList(SqList *L) {
    int i;
    for (i = 0; i < L->length; i++)
        printf("%d ", L->data[i]);
    printf("\n");
}

/*
 * 得到索引节点
 */
bool GetElem(SqList *L, int i, ElemType &e) {
    if (i < 1 || i > L->length)
        return false;
    e = L->data[i - 1];
    return true;
}

/*
 * 元素查找返回索引
 */
int LocateElem(SqList *L, ElemType e) {
    int i = 0;
    while (i < L->length && L->data[i] != e) i++;
    if (i >= L->length)
        return 0;
    else
        return i + 1;
}

/*
 * 连表插入  将e插入到i
 */
bool ListInsert(SqList &L, int i, ElemType e) {
    int j;
    if (i < 1 || i > L.length + 1)
        return false;
    i--;                        //将顺序表位序转化为elem下标
    for (j = L.length; j > i; j--)    //将data[i]及后面元素后移一个位置
        L.data[j] = L.data[j - 1];
    L.data[i] = e;
    L.length++;                //顺序表长度增1
    return true;
}

/*
 * 删除
 */
bool ListDelete(SqList &L, int i, ElemType &e) {
    int j;
    if (i < 1 || i > L.length)
        return false;
    i--;                        //将顺序表位序转化为elem下标
    e = L.data[i];
    for (j = i; j < L.length - 1; j++)    //将data[i]之后的元素前移一个位置
        L.data[j] = L.data[j + 1];
    L.length--;                //顺序表长度减1
    return true;
}


int main(){
    SqList L;
    const int n = 10;
    ElemType a[n] = {1,2,3,4,5,6,7,8,9,10};
    CreateList(L,a,n);
    DispList(&L);
    printf("%d",ListLength(&L));
    return 0;
}


```

## 输出
```
    1 2 3 4 5 6 7 8 9 10
    索引地址：2
    1 50 2 3 4 5 6 7 8 9 10
    当前长度: 11
    索引地址：3
    删除元素为：2
    1 50 3 4 5 6 7 8 9 10
    当前长度: 10
```



## &L *L *&区别
```
思考这个形参为什么要写成这两种形式，即SqList *L和SqList * &L的区别。

 　  *L是指针，全称是指针变量，是一个用来保存内存地址的变量。在这里是一个指向顺序表，存储顺序表的地址的变量。

　　* &L是指针类型的引用，引用（reference）是c++对c语言的重要扩充。引用就是原变量的另外一个名称（别名），引用变量本身没有自己的实际存储空间，对引用变量的操作，就是在操作原变量。这里的* &L代表原指针。

 　  这两个有着一个共同点，都指向顺序表 L ，如果在函数中修改L 的内容，都影响到 L 的内容。

      不同点则是，在函数中修改指针本身所指向的地址，*L 不会发生改变，而* &L会发生改变。

若要改变形参中的内容并且使用它则需要用引用，如果不需要改变子函数体中形参旳值，则不需要用引用。

　　首先，* &L是引用类型的指针，代表的是原指针，我们在函数中对指针的操作，都是直接对原指针的操作，无论是指针的内容，还是指针指向的地址，都会发生改变。

      那么，*L为什么在函数中会改变不了所指向的地址呢？

      其实，这里我们要延伸到函数形式参数和实际参数的很基础，也很重要的知识点了。

      形参出现在函数定义中，在整个函数体内都可以使用。实参出现在主调函数中，进入被调函数后，实参也不能使用。在函数调用的时候，主函数把实参的值传送给被调函数的形参，从而实现数据的传送。

      但是，在这个函数调用的过程中，数据传送是单向的，即数据只能由实参传到形参，而形参不会传回实参。也就是说，我们在函数中改变形参的值，实参的值是不会发生改变的，这就是函数调用中的单向值传递。

      那么，回到我们的 *L 来，*L其实就是一个变量，在这里是一个形式参数。形式参数在函数中其实是对实参的拷贝，也就是说，函数中形参其实是另一个变量，一个复制原变量的新变量，有不同于原变量的内存空间，存在于函数中，函数调用结束，即刻释放内存空间。

也就是说，我们在函数中改变 *L 所指向的地址，不是在对原变量进行改变，而是对原变量的一个复制体进行改变，改变了复制体，却没有改变本体。

      所以，在函数中 *L 不能改变所指向的地址。


```


