#include<stdio.h>
#include<pthread.h>

int arr[]={1,2,3,4,5,6,7,8,9,10,11,12};

void *cal(void *args)
{
    int start=*(int *) args;
    int *t_sum= (int *) malloc(sizeof(int));
    *t_sum=0;

    for(int i=start;i<start+3;i++)
    {
        *t_sum+=arr[i];
    }

    return (void *) t_sum;
}

int main()
{
    pthread_t th[4];

    int *t_sum;
    int total=0;

    for(int i=0;i<4;i++)
    {
        int *a=(int *) malloc(sizeof(int));
        *a=(12/4)*i;
        pthread_create(&th[i],NULL,&cal,(void *)a);
    }

    for(int i=0;i<4;i++)
    {
        pthread_join(th[i],(void **) &t_sum);
        printf(" th %d sum is %d\n",i,*t_sum);
        total+=*t_sum;
    }

    printf("%d",total);
}