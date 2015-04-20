---------------------------------------------------------------------------------------------------------------------

To run the "The Logic of Animal Conflict" Simulation, use the below command:
./main.pl

----------------------------------------------------------------------------------------------------------------------

Output Example:

Average pay offs in simulated intraspecific contest for 5 different strategies 

		Mouse		Hawk		Bully		Retaliator	Prober-Retaliator
Mouse		29.88		18.00		18.00		28.92		15.25
Hawk		80.00		-20.93		65.82		-12.97		-14.11
Bully		80.00		7.20		40.27		14.12		14.13
Retaliator	31.08		-27.42		41.72		30.54		31.08
Probe-Retali	59.84		-26.18		42.91		20.54		11.17


ESS Simulation1: To show even if Hawk is more in population; its strategy is not ESS 
Number of Mouse = 25 
Number of Hawk = 60 
Number of Bully = 15 

Average pay off Mouse = 20.91 
Average pay off Hawk = 18.30 
Average pay off Bully = 30.50 
As mouse and bully does better than hawk where population consist mostly of hawks

ESS Simulation2: To show even if Mouse is more in population; its strategy is not ESS 
Number of Mouse = 60 
Number of Hawk = 10 
Number of Bully = 15 
Number of Prober retaliator = 15 

Average pay off Mouse = 24.87 
Average pay off Hawk = 53.89 
Average pay off Bully = 58.24 
Average pay off Prober retaliator = 41.90 
As Hawk, Bully and Prober Retaliator does better than Mouse where population consist mostly of Mouse

ESS Simulation3: To show if Retaliator is more in population; its strategy is an ESS 
Number of Mouse = 5 
Number of Hawk = 5 
Number of Bully = 5 
Number of Prober retaliator = 5 
Number of Retaliator = 80 

Average pay off Mouse = 27.60 
Average pay off Hawk = -3.40 
Average pay off Bully = 18.72 
Average pay off Prober retaliator = 19.15 
Average pay off Retaliator = 27.04 
As Hawk, Bully, Mouse and Prober Retaliator does not perform better than Retaliator where population consist mostly of Retaliator

-----------------------------------------------------------------------------------------------------------------------

Total Files present:
- main.pl
- Bully.pm
- Mouse.pm
- Hawk.pm
- Retaliator.pm
- Probe_Retaliator.pm

-----------------------------------------------------------------------------------------------------------------------
