# SAGA-Optimization-Credit-Lending-Decision
## **Problem Statement**

During any financial crisis, there is very limited credit available within the banking sector. This has to be managed to distribute the limited credit available in a way that maximizes their profits in the time of crisis .Therefore, there is a need to set an optimal mechanism of bank lending decisions that will maximize the bank profit in a timely manner.The paper therefore proposes a model based on Genetic Algorithm (GA) to organize bank lending decision in a highly competing environment with credit crunch constraint.

## **Introduction**

This project deals with the implementation of Genetic Algorithms and Amalgamation of Genetic Algorithm with Simulated Annealing, to make Bank Lending Decision.

The objectives of the model are:

1) Determine a bank lending decision that maximizes bank profit
2) Determine a bank lending decision that minimizes the crediting cost

## **Methodology**

In the proposed method, the lending decision is dynamically decided based on customer&#39;s loan characteristics. It is assumed that all customers are applicable (good) to get the required loan.GA is employed to search for the most suitable customers depending on a set of factors such as loan age, loan size, loan interest rate, loan type, and borrower credit rating.Moreover, bank variables that are considered for selecting this optimal solution are loan interest rate, expected loan loss ,deposit rate ,reserve ratio, transaction cost .

![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/methodology.PNG)

## **Variables used**

**1) Loan Age (α)** – No. of years for repaying the loan

**2) Credit Limit –** Maximum loan amount a borrower is eligible for.

**3) Loan Size (L)** – amount of loan requested by a specific customer

**4) Loan Interest Rate (rL) –** Interest rates are determined using loan age and loan type. These are defined for each borrower based on the mentioned parameters.

**5) Expected Loan Loss (λ) –** Borrow Credit Rating is used to measure the range of the expected

![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/vars.PNG) 

The above data is to be used while implementing the GA or GA-SA algorithms.

## **Genetic Algorithm Fitness Function**

![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/fitness.PNG)
![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/fitness%202.PNG)



## **GA Validation Process to Generate a GA population with n chromosomes**

In the given data, we have 10 customers, so size of each chromosome is 1x10 , where each bit consists of 1 or 0 depending upon, whether the customer has been lent the loan or not. When we initially generate a population of chromosomes , many of them might be exceeding the credit constraints of the banks .The chromosomes which do not satisfy the credit crunch constraint are discarder .This can be done by calculating the total amount of loan allocation for a solution and comparing it with the total allowable loan amount of the bank.

![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/Ga%20valiation.PNG)

## **Genetic Algorithm Pseudo Code**

    - Generate Initial Population that satisfies GA Validation Process.
    - For n iterations:
          -Evaluate Fitness of Each Lending Decision in the population
          -Perform Roulette Wheel Selection to get Parent Pool
          -Create New Generation Population using Reproduction, Crossover and Mutation
          -Perform Forceful Crossover in case no solution generated in new generation
          -Check Validity of solutions in New Generation Population
          -Store Best Solution of each generation
    - Plot and display best Solution

## **GA Results**

&quot;Best Fitness Value &quot; &quot;6.8352&quot;
&quot;Best Bank Lending…&quot; &quot;1&quot; &quot;0&quot; &quot;1&quot; &quot;1&quot; &quot;0&quot; &quot;1&quot; &quot;0&quot; &quot;0&quot; &quot;1&quot; &quot;1&quot;  
So, we should lend money to &quot; Customer&quot; &quot;1&quot; &quot;--Rating&quot; &quot;AAA&quot;
&quot; Customer&quot; &quot;3&quot; &quot;--Rating&quot; &quot;A&quot;
&quot; Customer&quot; &quot;4&quot; &quot;--Rating&quot; &quot;AA&quot;
&quot; Customer&quot; &quot;6&quot; &quot;--Rating&quot; &quot;AAA&quot;
&quot; Customer&quot; &quot;9&quot; &quot;--Rating&quot; &quot;A&quot;
&quot; Customer&quot; &quot;10&quot; &quot;--Rating&quot; &quot;A&quot;

![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/GA.PNG)

## **Genetic Algorithm-Simulated Annealing(GA-SA) Pseudo Code**

      - Generate Initial Population that satisfies GA Validation Process.
      - For n iterations:
            -Evaluate Fitness of Each Lending Decision in the population
            -Perform Roulette Wheel Selection to get Parent Pool
            -Create New Generation Population using Reproduction, Crossover and Mutation
            -Perform Forceful Crossover in case no solution generated in new generation
            
                -Simulated Annealing Loop
                While T\&gt;Tmin:
                    For k iterations:
                        For each chromosome:
                            -generate neighbourhood solution by swapping bits
                            -calculate fitness and compare with fitness of parent
                            -if fitness of neighbour \&lt; fitness of parent:
                            Accept solution with Metropolis Criterion
                            -else keep original sol.
                  -T=t\*c --- cooling

            -Check Validity of solutions in New Generation Population
            -Store Best Solution of each generation
      - Plot and display best Solution

## **GA-SA Results**

&quot;Best Fitness Value &quot; &quot;6.5293&quot;
&quot;Best Bank Lending…&quot; &quot;1&quot; &quot;0&quot; &quot;1&quot; &quot;0&quot; &quot;0&quot; &quot;1&quot; &quot;0&quot; &quot;1&quot; &quot;1&quot; &quot;1&quot;
So, we should lend money to &quot; Customer&quot; &quot;1&quot; &quot;Rating&quot; &quot;AAA&quot;
&quot; Customer&quot; &quot;3&quot; &quot;Rating&quot; &quot;A&quot;
&quot; Customer&quot; &quot;6&quot; &quot;Rating&quot; &quot;AAA&quot;
&quot; Customer&quot; &quot;8&quot; &quot;Rating&quot; &quot;AAA&quot;
&quot; Customer&quot; &quot;9&quot; &quot;Rating&quot; &quot;A&quot;
&quot; Customer&quot; &quot;10&quot; &quot;Rating&quot; &quot;A&quot;

![](https://github.com/Shashank-Sundi/GA-Optimization-Bank-Lending-Decision-/blob/main/saga.PNG)

## **Comparison of GA and GA-SA-amalgamation**

- It is observed that GA gives better solution than GA-SA. The best fitness value obtained using GA is 6.8352 whereas best fitness using GA-SA is 6.5293.
- Using GA , the loan is lent to customers – 1,3,4,6,9,10 and using GA-SA we get customers 1,3,6,8,9,10.
- The solution in GA converges faster , but it starts to fluctuate wildly after some iterations. However, in GA-SA the solution initially fluctuates and then reaches convergence with increase in iterations.
- Thus we can conclude that although GA gives better solutions , it is not as stable as GA-SA. Both algorithms give good results and are hence good algorithms to be used , depending on the use case.
