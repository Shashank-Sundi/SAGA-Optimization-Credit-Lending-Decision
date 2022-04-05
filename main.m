%% Author : Shashank Sundi :19IM10028
%% Bank Lending Descision Optimization

clc
clear
close all

% GA Parameters
maxit = 100;
crossover_ratio = 0.8;
mutation_ratio = 0.006;
reproduction_ratio=0.2;
K=0.15;
D=60;
L=[10 25 4 11 18 3 17 15 9 10];

% Simulated Annealing Parameters
T_init=100;     % initial temp
c=0.2;         %cooling ratio
T_min=5;      %final temp
T=T_init;
sa_iters=3;
k=1; % boltzman const
%population size
n=60;

% Generate Initial Population
init_pop=generate_pop(n);
current_gen=init_pop;
best_sols=[];
% Genetic Agorithm Loop
for it=1:maxit
    new_gen=[];

    % Evaluate Fitness of Each Lending Decision 
    % in the population
    pop_fitness=[];
    for i=1:size(current_gen,1)
        pop_fitness=cat(2,pop_fitness,fitness(current_gen(i,:)));
    end
    
    best_index=find(pop_fitness==max(pop_fitness));
    if length(best_index)>1
        best=current_gen(best_index(1),:);
    else
        best=current_gen(best_index,:);
    end
    best_sols=cat(1,best_sols ,[max(pop_fitness)  best]);
    

    % Roulette Wheel Selection 
    parents=current_gen(roulette(pop_fitness),:);
   
    % Reproduction
    if reproduction_ratio>rand
        reprd_sols=30;
        x=randsample(size(current_gen,1),reprd_sols);
        new_gen=[new_gen current_gen(x,:)];
    end

    % Single Point Crossover 
    if crossover_ratio>rand
        for i=1:size(parents,1)
            for j=1:size(parents,1)
                child=crossover(parents(i,:),parents(j,:));
                new_gen=cat(1,new_gen,child);
            end
        end
    end

    % Mutation
    for i=1:size(parents,1)
        if mutation_ratio>rand
            child=mutation(parents(i,:));
            new_gen=cat(1,new_gen,child);
        end
    end
    
    %forceful crossover, in case no new solution is formed in new
    %generation
    if size(new_gen,1)==0
        new_gen=init_pop;
        for i=1:size(parents,1)
            for j=1:size(parents,1)
                child=crossover(parents(i,:),parents(j,:));
                new_gen=cat(1,new_gen,child);
            end
        end
    end

    

    % Simulated Annealing Portion
    while T>T_min
        for iter=1:sa_iters
            for i=1:size(new_gen,1)
                f1=fitness(new_gen(i,:));
                % Generate neighbor by swapping
                a=randsample(find(new_gen(1,:)==0),1);
                alt_sol=new_gen(i,:);
                copy=alt_sol;
                if a==1 
                    b=1;
                else
                    b=-1;
                end
                alt_sol(a+b)=copy(a);
                alt_sol(a)=copy(a+b);
                f2=fitness(alt_sol);
    
                % Metropolis Criterion
                if f2<f1
                    prob=exp(-(f2-f1)/(k*T));
                    if prob>rand
                       new_gen(i,:)=alt_sol;
                    end
                end
            end
        end
        T=T*c; 
    end

    % Check Validity of Newly Generated Solutions
    for a=1:size(new_gen,1)
        % Calculate Total Amount of Loans
        total_loan=sum(new_gen(a,:).*L);
        % check if constraint is satisfied
        if total_loan>(1-K)*D
            new_gen(a,:)=0;
        end
    end
    current_gen=new_gen;
    
end
disp(["Best Fitness Value ",max(best_sols(:,1))])
k=find(best_sols(:,1)==max(best_sols(:,1)));
disp(["Best Bank Lending Decision",best_sols(k(1),2:11)])
z=best_sols(k(1),2:11);
disp("So, we should lend money to")
rating=["AAA" "BB" "A" "AA" "BBB" "AAA" "BB" "AAA" "A" "A"];
for i=1:10
    if z(i)==1
        disp([" Customer" ,i,"Rating",rating(i),"For",L(i),"Years"])
        
    end
end
%% final result
plot(1:it,best_sols(:,1));
xlabel('No of iteration')
ylabel('Best Fitness Values of Each Generation')
hold on
