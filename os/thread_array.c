#include<stdio.h>
#include<pthread.h>

int sum=0;
pthread_mutex_t m;

void *cal(void * args)
{
    
    for(int i=1;i<=1000000;i++) 
    {
        pthread_mutex_lock(&m);
        sum+=i;
        pthread_mutex_unlock(&m);
    }
    return NULL;
}

int main()
{
    pthread_mutex_init(&m,NULL);
    pthread_t th[8];

    for(int i=0;i<8;i++)
    {
        pthread_create(&th[i],NULL,&cal,NULL);
    }
    for(int i=0;i<8;i++)
    {
        pthread_join(&th[i],NULL);
    }

    pthread_mutex_destroy(&m);

    printf("%d",sum);
}