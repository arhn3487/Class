#include<stdio.h>
#include<pthread.h>

void *computation(void *sum)
{
    int *total=(int *) sum;
    int s=0;

    for(int i=0;i<1000000000;i++) s+=*total;

    return NULL;
}

int main()
{
    pthread_t thread1;
    pthread_t thread2;

    int val1=1;
    int val2=2;

    pthread_create(&thread1,NULL,computation,(void *) &val1);
    pthread_create(&thread2,NULL,computation,(void *) &val2);

    pthread_join(thread1,NULL);
    pthread_join(thread2,NULL);


}