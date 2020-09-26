## 链表
```c
#include <stdio.h>
#include <malloc.h>
typedef int ElemType;

typedef struct LNode  		//定义单链表结点类型
{
    ElemType data;
    struct LNode *next;		//指向后继结点
} LinkList;

void CreateListF(LinkList *&L,ElemType a[],int n)
//头插法建立单链表
{
    LinkList *s;int i;
    L=(LinkList *)malloc(sizeof(LinkList));  	//创建头结点
    L->next=NULL;
    for (i=0;i<n;i++)
    {
        s=(LinkList *)malloc(sizeof(LinkList));//创建新结点
        s->data=a[i];
        s->next=L->next;			//将*s插在原开始结点之前,头结点之后
        L->next=s;
    }
}
void CreateListR(LinkList *&L,ElemType a[],int n)
//尾插法建立单链表
{
    LinkList *s,*r;int i;
    L=(LinkList *)malloc(sizeof(LinkList));  	//创建头结点
    L->next=NULL;
    r=L;					//r始终指向终端结点,开始时指向头结点
    for (i=0;i<n;i++)
    {
        s=(LinkList *)malloc(sizeof(LinkList));//创建新结点
        s->data=a[i];
        r->next=s;			//将*s插入*r之后
        r=s;
    }
    r->next=NULL;			//终端结点next域置为NULL
}
void InitList(LinkList *&L)
{
    L=(LinkList *)malloc(sizeof(LinkList));  	//创建头结点
    L->next=NULL;
}
void DestroyList(LinkList *&L)
{
    LinkList *p=L,*q=p->next;
    while (q!=NULL)
    {	free(p);
        p=q;
        q=p->next;
    }
    free(p);	//此时q为NULL,p指向尾结点,释放它
}
bool ListEmpty(LinkList *L)
{
    return(L->next==NULL);
}
int ListLength(LinkList *L)
{
    LinkList *p=L;int i=0;
    while (p->next!=NULL)
    {	i++;
        p=p->next;
    }
    return(i);
}
void DispList(LinkList *L)
{
    LinkList *p=L->next;
    while (p!=NULL)
    {	printf("%d ",p->data);
        p=p->next;
    }
    printf("\n");
}
bool GetElem(LinkList *L,int i,ElemType &e)
{
    int j=0;
    LinkList *p=L;
    while (j<i && p!=NULL)
    {	j++;
        p=p->next;
    }
    if (p==NULL)			//不存在第i个数据结点
        return false;
    else					//存在第i个数据结点
    {	e=p->data;
        return true;
    }
}
int LocateElem(LinkList *L,ElemType e)
{
    LinkList *p=L->next;
    int n=1;
    while (p!=NULL && p->data!=e)
    {	p=p->next;
        n++;
    }
    if (p==NULL)
        return(0);
    else
        return(n);
}
bool ListInsert(LinkList *&L,int i,ElemType e)
{

    int j=0;
    LinkList *p=L,*s;
    while (j<i-1 && p!=NULL) //查找第i-1个结点
    {	j++;
        p=p->next;
    }
    if (p==NULL)	//未找到位序为i-1的结点
        return false;
    else			//找到位序为i-1的结点*p
    {	s=(LinkList *)malloc(sizeof(LinkList));//创建新结点*s
        s->data=e;
        s->next=p->next;						//将*s插入到*p之后
        p->next=s;
        return true;
    }
}
bool ListDelete(LinkList *&L,int i,ElemType &e)
{
    int j=0;
    LinkList *p=L,*q;
    while (j<i-1 && p!=NULL)	//查找第i-1个结点
    {	j++;
        p=p->next;
    }
    if (p==NULL)				//未找到位序为i-1的结点
        return false;
    else						//找到位序为i-1的结点*p
    {	q=p->next;				//q指向要删除的结点
        if (q==NULL)
            return false;			//若不存在第i个结点,返回false
        e=q->data;
        p->next=q->next;		//从单链表中删除*q结点
        free(q);				//释放*q结点
        return true;
    }
}


int main(){

    LinkList *L;

    InitList(L);
    ElemType a[10] = {1,2,3,4,5,6,7,8,9,10};

    // 创建顺序表
    CreateListR(L,a,10);

    // 显示顺序表
    DispList(L);
    printf("索引长度：%d\n",LocateElem(L,2));
    ListInsert(L,2,50);
    // 显示顺序表
    DispList(L);
    printf("当前长度: %d\n",ListLength(L));

    printf("索引地址：%d\n",LocateElem(L,2));

    // 删除元素
    ElemType e = NULL;
    ListDelete(L,3,e);
    printf("删除元素为：%d\n",e);
    DispList(L);
    printf("当前长度: %d\n",ListLength(L));

    GetElem(L,2,e);


    return 0;
}

```

### 输出
```
1 2 3 4 5 6 7 8 9 10
索引长度：2
1 50 2 3 4 5 6 7 8 9 10
当前长度: 11
索引地址：3
删除元素为：2
1 50 3 4 5 6 7 8 9 10
当前长度: 10
```

## 指针引用 *&
```
将指针类型引用，起别名，其实本身依然是指针，只不过当取值时，即取地址的值时，不需要进行解操作
```

