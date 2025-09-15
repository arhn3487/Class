#include<stdio.h>
#include<pthread.h>

int mils=0;
pthread_mutex_t m;

void * cal(void *args)
{
    for(int i=0;i<=100000;i++)
    {
        pthread_mutex_lock(&m);
        mils+=10;
        pthread_mutex_unlock(&m);
    }
    return NULL;
}

int main()
{
    pthread_t t1,t2;

    pthread_mutex_init(&m,NULL);

    pthread_create(&t1,NULL,cal,NULL);
    pthread_create(&t2,NULL,cal,NULL);

    pthread_join(t1,NULL);
    pthread_join(t2,NULL);

    pthread_mutex_destroy(&m);

    printf("%d",mils);
}