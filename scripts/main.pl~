#!/usr/bin/perl -w
# Ruturaj and Pratima
# Main program generating contests and assigning the opponents
# main.pl

use Mouse;
use Hawk;
use Bully;
use Retaliator;
use Prober_Retaliator;
use strict;
use warnings;

my $PRINT_MOVES = 0; #1 if you want to print all moves; 0 otherwise
my $PRINT_PAY_OFF = 0; #1 if you want to print the pay off; 0 otherwise
my $NUMBER_OF_SIMULATIONS = 2000; #number of simulations to conduct for all the possible 15 types

my $PROBABILITY_INJURY = 0.1; #probability of serious injury after receiving single D

my $MAX_MOVES_MOUSE = 20; #pre assigned number of moves for mouse
my $MAX_MOVES_RETALIATOR = 20; #pre assigned number of moves for retaliator
my $MAX_MOVES_PROBER_RETALIATOR = 20; #pre assigned number of moves for prober-retaliator

my $PROBABILITY_RETALIATE_RETALIATOR = 1.0; #probability of retaliating against the probe

my $PROBABILITY_PROBE_PROBER_RETALIATOR = 0.05; #probability of probing on the opening move or after receiving C
my $PROBABILITY_RETALIATE_PROBER_RETALIATOR = 1.0; #probability of retaliating against the probe

my $PAY_OFF_WIN = 60; #pay off for winning
my $PAY_OFF_INJURY = -100; #pay off for receiving serious injury
my $PAY_OFF_SCRATCH = -2; #pay off for receiving scratches on D
my $MAX_PAY_OFF_SAVE_ENERGY = 20; #pay off for saving energy

#subroutine that internally calls the specified opponents next move
sub fight{
	(my $input1,my $input2,my $count) = @_;
	my $i=$count;
	for($i=0; $i<$count;++$i){
		my $numb=int(rand(10))/10;
		my $animal1;
		my $animal2;

		#decide which animal will play first move
		if($numb < 0.5){
			$animal1=$input1;
			$animal2=$input2;
		}else{
			$animal2=$input1;
			$animal1=$input2;
		}

		$animal1->newFight();
		$animal2->newFight();

		my $animal1moves="";
		my $animal2moves=" ";	
	
		my $opponentsmove="";

		#infinitely call the moves turn by turn; break if anyone is winner
		while(1){
			$opponentsmove=$animal1->next_move($opponentsmove);
			$animal1moves=$animal1moves.$opponentsmove." ";
			if($opponentsmove eq "W"){
				#print "animal1 won\n";
				last;
			}
			$opponentsmove=$animal2->next_move($opponentsmove);
			$animal2moves=$animal2moves.$opponentsmove." ";
			if($opponentsmove eq "W"){
				#print "anima2 won\n";
				last;
			}
		}
	
		#print the moves
		if($PRINT_MOVES==1){
			print $animal1moves."\n";
			print $animal2moves."\n\n";
		}
	}
	
	#print the pay off
	if($PRINT_PAY_OFF==1){
		print "Input1 payoff = " . $input1->avg_payoff() . "\n";
		print "Input2 payoff = " . $input2->avg_payoff() . "\n";
	}

}

sub main{

#	my $hawk6 = new Hawk($PROBABILITY_INJURY);
#	my $proberetaliator4 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
#	fight($hawk6,$proberetaliator4,100);

#	my $hawk4 = new Hawk($PROBABILITY_INJURY);
#	my $bully4 = new Bully($PROBABILITY_INJURY);
#	fight($hawk4,$bully4,100);


	#my $proberetaliator1 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	#my $proberetaliator2 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	#fight($proberetaliator1,$proberetaliator2,100);

	#my $mouse6 = new Mouse($MAX_MOVES_MOUSE);
	#my $proberetaliator3 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	#fight($mouse6,$proberetaliator3,$NUMBER_OF_SIMULATIONS);

#=pod


	#run each of the below 15 types for 2000 simulations

	# mouse vs mouse
	my $mouse1 = new Mouse($MAX_MOVES_MOUSE);
	my $mouse2 = new Mouse($MAX_MOVES_MOUSE);
	fight($mouse1,$mouse2,$NUMBER_OF_SIMULATIONS);
	
	# mouse vs hawk
	my $mouse3 = new Mouse($MAX_MOVES_MOUSE);
	my $hawk3 = new Hawk($PROBABILITY_INJURY);
	fight($mouse3,$hawk3,$NUMBER_OF_SIMULATIONS);

	# mouse vs bully
	my $mouse4 = new Mouse($MAX_MOVES_MOUSE);
	my $bully3 = new Bully($PROBABILITY_INJURY);
	fight($mouse4,$bully3,$NUMBER_OF_SIMULATIONS);
	
	# mouse vs retaliator
	my $mouse5 = new Mouse($MAX_MOVES_MOUSE);
	my $retaliator3 = new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	fight($mouse5,$retaliator3,$NUMBER_OF_SIMULATIONS);

	# mouse vs prober-retaliator
	my $mouse6 = new Mouse($MAX_MOVES_MOUSE);
	my $proberetaliator3 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	fight($mouse6,$proberetaliator3,$NUMBER_OF_SIMULATIONS);

	# hawk vs hawk
	my $hawk1 = new Hawk($PROBABILITY_INJURY);
	my $hawk2 = new Hawk($PROBABILITY_INJURY);	
	fight($hawk1,$hawk2,$NUMBER_OF_SIMULATIONS);

	# hawk vs bully
	my $hawk4 = new Hawk($PROBABILITY_INJURY);
	my $bully4 = new Bully($PROBABILITY_INJURY);
	fight($hawk4,$bully4,$NUMBER_OF_SIMULATIONS);

	# hawk vs retaliator
	my $hawk5 = new Hawk($PROBABILITY_INJURY);
	my $retaliator4 = new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	fight($hawk5,$retaliator4,$NUMBER_OF_SIMULATIONS);

	# hawk vs prober-retaliator
	my $hawk6 = new Hawk($PROBABILITY_INJURY);
	my $proberetaliator4 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	fight($hawk6,$proberetaliator4,$NUMBER_OF_SIMULATIONS);

	# bully vs bully
	my $bully1= new Bully($PROBABILITY_INJURY);
	my $bully2= new Bully($PROBABILITY_INJURY);
	fight($bully1,$bully2,$NUMBER_OF_SIMULATIONS);

	# bully vs retaliator
	my $bully5= new Bully($PROBABILITY_INJURY);	
	my $retaliator5 = new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	fight($bully5,$retaliator5,$NUMBER_OF_SIMULATIONS);	

	# bully vs prober-retaliator
	my $bully6= new Bully($PROBABILITY_INJURY);
	my $proberetaliator5 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	fight($bully6,$proberetaliator5,$NUMBER_OF_SIMULATIONS);

	# retaliator vs retaliator
	my $retaliator1 = new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	my $retaliator2 = new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	fight($retaliator1,$retaliator2,$NUMBER_OF_SIMULATIONS);

	# retaliator vs prober-retaliator
	my $retaliator6 = new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	my $proberetaliator6 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	fight($retaliator6,$proberetaliator6,$NUMBER_OF_SIMULATIONS);

	# prober-retaliator vs prober-retaliator 
	my $proberetaliator1 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	my $proberetaliator2 = new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	fight($proberetaliator1,$proberetaliator2,$NUMBER_OF_SIMULATIONS);

	print "\nAverage pay offs in simulated intraspecific contest for 5 different strategies \n\n";

	print "\t\tMouse\t\tHawk\t\tBully\t\tRetaliator\tProber-Retaliator"."\n";
	my $line1 = sprintf ("Mouse\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\n",$mouse1->avg_payoff(),$mouse3->avg_payoff(),$mouse4->avg_payoff(),$mouse5->avg_payoff(),$mouse6->avg_payoff());
	my $line2 = sprintf ("Hawk\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\n",$hawk3->avg_payoff(),$hawk1->avg_payoff(),$hawk4->avg_payoff(),$hawk5->avg_payoff(),$hawk6->avg_payoff());
	my $line3 = sprintf ("Bully\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\n",$bully3->avg_payoff(),$bully4->avg_payoff(),$bully1->avg_payoff(),$bully5->avg_payoff(),$bully6->avg_payoff());
	my $line4 = sprintf ("Retaliator\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\n",$retaliator3->avg_payoff(),$retaliator4->avg_payoff(),$retaliator5->avg_payoff(),$retaliator1->avg_payoff(),$retaliator3->avg_payoff());
	my $line5 = sprintf ("Probe-Retali\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\t\t%0.2f\n",$proberetaliator3->avg_payoff(),$proberetaliator4->avg_payoff(),$proberetaliator5->avg_payoff(),$proberetaliator6->avg_payoff(),$proberetaliator1->avg_payoff());
	
	#print the average pay offs in simulated intraspecific contests
	print $line1;
	print $line2;
	print $line3;
	print $line4;
	print $line5;
	print "\n\n";

#=cut
	#create array of animal
	#add 100 animals in it % wise
	my $percentageofmouse = 25; 
	my $percentageofhawk = 60;
	my $percentageofbully = 15;
	my @animalarray;
	my $i;

	#create some more mice
	for($i=0;$i<$percentageofmouse;++$i){
		$animalarray[$i]=new Mouse($MAX_MOVES_MOUSE);
	}

	#create some more hawk
	my $arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofhawk;++$i){ #keep $i same
		$animalarray[$i]=new Hawk($PROBABILITY_INJURY);
	}

	#create some more bully
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofbully;++$i){ #keep $i same
		$animalarray[$i]=new Bully($PROBABILITY_INJURY);
	}
	
	#after creating all animals
	my $numberoffights = 20000;
	
	#choose any 2 random animals for fight
	$i=0;
	while($i<$numberoffights){
		my $randomindex1=int(rand(100));
		my $randomindex2=int(rand(100));
		while ($randomindex1==$randomindex2){
			 $randomindex2=int(rand(100));
		}
		fight($animalarray[$randomindex1],$animalarray[$randomindex2],1);
		$i++;
	}
	
	my $totalpayoffhawk=0;
	my $totalpayoffmouse=0;
	my $totalpayoffbully=0;

	#calculate the total payoff
	for($i=0;$i<$percentageofmouse;++$i){
		$totalpayoffmouse += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	my $averagemouse = $totalpayoffmouse/$percentageofmouse;

	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofhawk;++$i){
		$totalpayoffhawk += $animalarray[$i]->avg_payoff();
	}	
	#calculate the average
	my $averagehawk = $totalpayoffhawk/$percentageofhawk;
	
	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofbully;++$i){ #keep $i same
		$totalpayoffbully += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	my $averagebully = $totalpayoffbully/$percentageofbully;
		
	
	print "ESS Simulation1: To show even if Hawk is more in population; its strategy is not ESS \n";
	print "Number of Mouse = 25 \n";
	print "Number of Hawk = 60 \n";
	print "Number of Bully = 15 \n\n";

	printf "Average pay off Mouse = %0.2f \n", $averagemouse;
	printf "Average pay off Hawk = %0.2f \n", $averagehawk;
	printf "Average pay off Bully = %0.2f \n", $averagebully;

	print "As mouse and bully does better than hawk where population consist mostly of hawks\n\n";


	#create array of animal
	#add 100 animals in it % wise
	$percentageofmouse = 60; 
	$percentageofhawk = 10;
	$percentageofbully = 15;
	my $percentageofprobereta = 15;
	$i=0;

	#create some more mice
	for($i=0;$i<$percentageofmouse;++$i){
		$animalarray[$i]=new Mouse($MAX_MOVES_MOUSE);
	}

	#create some more hawk
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofhawk;++$i){ #keep $i same
		$animalarray[$i]=new Hawk($PROBABILITY_INJURY);
	}

	#create some more bully
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofbully;++$i){ #keep $i same
		$animalarray[$i]=new Bully($PROBABILITY_INJURY);
	}

	#create some more probe retaliator
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofprobereta;++$i){ #keep $i same
		$animalarray[$i]=new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	}
		
	#choose any 2 random animals for fight
	$i=0;
	while($i<$numberoffights){
		my $randomindex1=int(rand(100));
		my $randomindex2=int(rand(100));
		while ($randomindex1==$randomindex2){
			 $randomindex2=int(rand(100));
		}
		fight($animalarray[$randomindex1],$animalarray[$randomindex2],1);
		$i++;
	}

	$totalpayoffhawk=0;
	$totalpayoffmouse=0;
	$totalpayoffbully=0;
	my $totalpayoffprobereta=0;
	
	#calculate the total payoff
	$totalpayoffmouse=0;
	for($i=0;$i<$percentageofmouse;++$i){
		$totalpayoffmouse += $animalarray[$i]->avg_payoff();
	}	
	
	#calculate the average
	$averagemouse = $totalpayoffmouse/$percentageofmouse;

	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofhawk;++$i){
		$totalpayoffhawk += $animalarray[$i]->avg_payoff();
	}	
	#calculate the average
	$averagehawk = $totalpayoffhawk/$percentageofhawk;
	
	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofbully;++$i){ #keep $i same
		$totalpayoffbully += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	$averagebully = $totalpayoffbully/$percentageofbully;

	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofprobereta;++$i){ #keep $i same
		$totalpayoffprobereta += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	my $averageprobereta = $totalpayoffprobereta/$percentageofprobereta;
	
	print "ESS Simulation2: To show even if Mouse is more in population; its strategy is not ESS \n";
	print "Number of Mouse = 60 \n";
	print "Number of Hawk = 10 \n";
	print "Number of Bully = 15 \n";
	print "Number of Prober retaliator = 15 \n\n";

	printf "Average pay off Mouse = %0.2f \n", $averagemouse;
	printf "Average pay off Hawk = %0.2f \n", $averagehawk;
	printf "Average pay off Bully = %0.2f \n", $averagebully;
	printf "Average pay off Prober retaliator = %0.2f \n", $averageprobereta;

	print "As Hawk, Bully and Prober Retaliator does better than Mouse where population consist mostly of Mouse\n\n";
	
	#create array of animal
	#add 100 animals in it % wise
	$percentageofmouse = 5; 
	$percentageofhawk = 5;
	$percentageofbully = 5;
	$percentageofprobereta = 5;
	my $percentageofreta = 80;
	$i=0;

	#create some more mice
	for($i=0;$i<$percentageofmouse;++$i){
		$animalarray[$i]=new Mouse($MAX_MOVES_MOUSE);
	}

	#create some more hawk
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofhawk;++$i){ #keep $i same
		$animalarray[$i]=new Hawk($PROBABILITY_INJURY);
	}

	#create some more bully
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofbully;++$i){ #keep $i same
		$animalarray[$i]=new Bully($PROBABILITY_INJURY);
	}

	#create some more prober retaliator
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofprobereta;++$i){ #keep $i same
		$animalarray[$i]=new Prober_Retaliator($MAX_MOVES_PROBER_RETALIATOR,$PROBABILITY_PROBE_PROBER_RETALIATOR,$PROBABILITY_RETALIATE_PROBER_RETALIATOR,$PROBABILITY_INJURY);
	}

	#create some more retaliator
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofreta;++$i){ #keep $i same
		$animalarray[$i]=new Retaliator($MAX_MOVES_RETALIATOR,$PROBABILITY_RETALIATE_RETALIATOR,$PROBABILITY_INJURY);
	}
		
	#choose any 2 random animals for fight
	$i=0;
	while($i<$numberoffights){
		my $randomindex1=int(rand(100));
		my $randomindex2=int(rand(100));
		while ($randomindex1==$randomindex2){
			 $randomindex2=int(rand(100));
		}
		fight($animalarray[$randomindex1],$animalarray[$randomindex2],1);
		$i++;
	}

	$totalpayoffhawk=0;
	$totalpayoffmouse=0;
	$totalpayoffbully=0;
	$totalpayoffprobereta=0;
	my $totalpayoffreta=0;
	
	#calculate the total payoff
	$totalpayoffmouse=0;
	for($i=0;$i<$percentageofmouse;++$i){
		$totalpayoffmouse += $animalarray[$i]->avg_payoff();
	}	
	
	#calculate the average
	$averagemouse = $totalpayoffmouse/$percentageofmouse;

	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofhawk;++$i){
		$totalpayoffhawk += $animalarray[$i]->avg_payoff();
	}	
	#calculate the average
	$averagehawk = $totalpayoffhawk/$percentageofhawk;
	
	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofbully;++$i){ #keep $i same
		$totalpayoffbully += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	$averagebully = $totalpayoffbully/$percentageofbully;

	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofprobereta;++$i){ #keep $i same
		$totalpayoffprobereta += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	$averageprobereta = $totalpayoffprobereta/$percentageofprobereta;

	#calculate the total payoff
	$arrayfilledupto = $i;
	for(;$i<$arrayfilledupto+$percentageofreta;++$i){ #keep $i same
		$totalpayoffreta += $animalarray[$i]->avg_payoff();
	}
	#calculate the average
	my $averagereta = $totalpayoffreta/$percentageofreta;
	
	print "ESS Simulation3: To show if Retaliator is more in population; its strategy is an ESS \n";
	print "Number of Mouse = 5 \n";
	print "Number of Hawk = 5 \n";
	print "Number of Bully = 5 \n";
	print "Number of Prober retaliator = 5 \n";
	print "Number of Retaliator = 80 \n\n";

	printf "Average pay off Mouse = %0.2f \n", $averagemouse;
	printf "Average pay off Hawk = %0.2f \n", $averagehawk;
	printf "Average pay off Bully = %0.2f \n", $averagebully;
	printf "Average pay off Prober retaliator = %0.2f \n", $averageprobereta;
	printf "Average pay off Retaliator = %0.2f \n", $averagereta;

	print "As Hawk, Bully, Mouse and Prober Retaliator does not perform better than Retaliator where population consist mostly of Retaliator\n\n";
}

main();
