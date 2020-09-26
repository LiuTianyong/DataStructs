#include <stdio.h>
#include <malloc.h>

#define MaxSize 50
typedef int ElemType;


typedef struct {
    ElemType data[MaxSize];     //���˳���Ԫ��
    int length;                 //���˳���ĳ���
} SqList;                       //˳�������Ͷ���



//����˳���
void CreateList(SqList &L, ElemType a[], int n) {
    int i;
    L = *(SqList *) malloc(sizeof(SqList));
    for (i = 0; i < n; i++)
        L.data[i] = a[i];
    L.length = n;
}

/*
 * ��ʼ��
 */
void InitList(SqList &L) {
    L = *(SqList *) malloc(sizeof(SqList));    //���������Ա�Ŀռ�
    L.length = 0;
}

/*
 * ����
 */
void DestroyList(SqList &L) {
    free(&L);
}

/*
 * ���
 */
bool ListEmpty(SqList L) {
    return (L.length == 0);
}

/*
 * �󳤶�
 */
int ListLength(SqList L) {
    return (L.length);
}

/*
 * ���
 */
void DispList(SqList L) {
    int i;
    for (i = 0; i < L.length; i++)
        printf("%d ", L.data[i]);
    printf("\n");
}

/*
 * �õ������ڵ�
 */
bool GetElem(SqList L, int i, ElemType &e) {
    if (i < 1 || i > L.length)
        return false;
    e = L.data[i - 1];
    return true;
}

/*
 * Ԫ�ز��ҷ�������
 */
int LocateElem(SqList L, ElemType e) {
    int i = 0;
    while (i < L.length && L.data[i] != e) i++;
    if (i >= L.length)
        return 0;
    else
        return i + 1;
}

/*
 * �������  ��e���뵽i
 */
bool ListInsert(SqList &L, int i, ElemType e) {
    int j;
    if (L.length == MaxSize)
        return false;
    if (i < 1 || i > L.length + 1)
        return false;
    i--;                                 //��˳���λ��ת��Ϊelem�±�
    for (j = L.length; j > i; j--)      //��data[i]������Ԫ�غ���һ��λ��
        L.data[j] = L.data[j - 1];
    L.data[i] = e;
    L.length++;                         //˳�������1
    return true;
}

/*
 * ɾ��
 */
bool ListDelete(SqList &L, int i, ElemType &e) {
    int j;
    if (i < 1 || i > L.length)
        return false;
    i--;                        //��˳���λ��ת��Ϊelem�±�
    e = L.data[i];
    for (j = i; j < L.length - 1; j++)    //��data[i]֮���Ԫ��ǰ��һ��λ��
        L.data[j] = L.data[j + 1];
    L.length--;                //˳����ȼ�1
    return true;
}


int main(){
    SqList L;
    const int n = 10;
    ElemType a[n] = {1,2,3,4,5,6,7,8,9,10};
    // ����˳���
    CreateList(L,a,n);
    // ��ʾ˳���
    DispList(L);
    printf("������ַ��%d\n",LocateElem(L,2));
    ListInsert(L,2,50);
    // ��ʾ˳���
    DispList(L);
    printf("��ǰ����: %d\n",ListLength(L));

    printf("������ַ��%d\n",LocateElem(L,2));

    // ɾ��Ԫ��
    ElemType e = NULL;
    ListDelete(L,3,e);
    printf("ɾ��Ԫ��Ϊ��%d\n",e);
    DispList(L);
    printf("��ǰ����: %d\n",ListLength(L));

    GetElem(L,2,e);
    return 0;
}


