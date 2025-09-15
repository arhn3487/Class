#include<bits/stdc++.h>
using namespace std;

struct process
{
    int pid,at,bt,tat,ct,rt,bt_left,wt;
};

int tq=3;

void sjf(vector<process> &v)
{
    int n=v.size(),com=0,time=0;
    vector<bool> done(n,false);
    
    while(com<n)
    {
        int ind=-1,mn=INT_MAX;
        
        for(int i=0;i<n;i++)
        {
            if(mn>v[i].bt && v[i].at<=time && !done[i])
            {
                mn=v[i].bt;
                ind=i;
            }
        }

        if(ind==-1) 
        {
            time++;
            continue;
        }

        com++;
        time+=v[ind].bt;
        done[ind]=true;
        v[ind].ct=time;
        v[ind].tat=v[ind].ct-v[ind].at;
        v[ind].wt=v[ind].tat-v[ind].bt;
        
    }
}

void srtf(vector<process> &v)
{
    int n=v.size(),completed=0,time=0;
    vector<bool> done(n,false);
    for(auto &p : v) p.bt_left = p.bt;


    while(completed<n)
    {
        int ind=-1,mn=INT_MAX;

        for(int i=0;i<n;i++)
        {
            if(!done[i] && time>=v[i].at && v[i].bt_left<mn)
            {
                ind=i;
                mn=v[i].bt_left;
            }
        }

        if(ind==-1)
        {
            time++;
            continue;
        }

        time++;
        v[ind].bt_left--;

        if(v[ind].bt_left==0)
        {
            done[ind]=true;
            v[ind].ct=time;
            v[ind].tat=v[ind].ct-v[ind].at;
            v[ind].wt=v[ind].tat-v[ind].bt;
        }
    }
}

void round_robin(vector<process> &v)
{
    int n=v.size(),completed=0,time=0;
    vector<int> remaining(n,0);
    vector<bool> in_queue(n,false);
    queue<int> q;

    for(int i=0;i<n;i++)
    {
        if(v[i].at==0)
        {
            q.push(i);
            in_queue[i]=true;
        }
        remaining[i]=v[i].bt;
    }

    while(completed<n)
    {
        if(q.empty())
        {
            time++;
            for(int i=0;i<n;i++)
            {
                if(!in_queue[i] && remaining[i]>0 && v[i].at<=time)
                {
                    q.push(i);
                    in_queue[i]=true;
                }
            }
            continue;
        }

        int ind=q.front();
        int exe=min(tq,remaining[ind]);
        remaining[ind]-=exe;
        time+=exe;

        for(int i=0;i<n;i++)
        {
            if(!in_queue[i] && remaining[i]>0 && v[i].at <= time)
            {
                q.push(i);
                in_queue[i]=true;
            }
        }


        if(remaining[ind]>0)
        {
            q.push(ind);
        }
        else
        {
            v[ind].ct=time;
            v[ind].tat=v[ind].ct-v[ind].at;
            v[ind].wt=v[ind].tat-v[ind].bt;
            completed++;
        }
    }
}

int main()
{

}