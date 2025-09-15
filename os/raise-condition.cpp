#include<stdio.h>
#include<pthread.h>

int mils=0;

void *cal(void *args)
{
    for(int i=1;i<=100000;i++)
    {
        mils+=10;
    }

    return NULL;
}

int main()
{
    pthread_t t1,t2;
    pthread_create(&t1,NULL,cal,NULL);
    pthread_create(&t2,NULL,cal,NULL);

    pthread_join(t1,NULL);
    pthread_join(t2,NULL);

    printf("%d",mils);
}