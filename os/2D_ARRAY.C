#include<stdio.h>
#include<pthread.h>
#include <stdlib.h>

int arr[3][4]={
    {1,2,3,4},
    {5,6,7,8},
    {9,10,11,12}
};

void *cal(void *args)
{
    int start=*(int *) args;
    int *th_sum=(int *) malloc(sizeof(int));
    *th_sum=0;

    for(int i=0;i<4;i++)
    {
        *th_sum+=arr[start][i];
    }

    return (void *) th_sum; 
}

int main()
{
    pthread_t th[3];

    for(int i=0;i<3;i++)
    {
        int *a= (int *) malloc(sizeof(int));
        *a=i;
        pthread_create(&th[i],NULL,&cal,a);
    }

    int *th_sum;
    int t=0;

    for(int i=0;i<3;i++)
    {
        pthread_join(th[i],(void **)&th_sum);
        printf("the sume of thread %d is %d\n",i+1,*th_sum);
        t+=*th_sum;
    }

    printf("%d",t);
}