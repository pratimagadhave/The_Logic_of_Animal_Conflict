#!/usr/bin/perl -w
# Ruturaj and Pratima
# 
# Prober_Retaliator.pm

#declare a class
package Prober_Retaliator;

#subroutine with a constructor to assign the variables with the parameters passed
sub new
{
	my $class = shift;
	$self = {
		_MAX_MOVES => shift,
		_PROBABILITY_ESCALATE => shift,
		_PROBABILITY_RETALIATE => shift,
		_PROBABILITY_INJURY => shift,
		_payoff => 0,
		_moveNumber => 0,
		_escalate => 0,
		_totalFights => 0,
	};
	bless $self, $class;
	return $self;
}

#subroutine to set the initial values for move number and escalation and increment the fight count
sub newFight
{
	my ($self)=@_;
	$self->{_moveNumber}=0;
	$self->{_escalate}=0;
	++$self->{_totalFights};
}

#subroutine to play the next move based on the rules
sub next_move{

	my ($self)=@_;
	$opponentsMove = $_[1];

	#if winner calculate payoff
	if($opponentsMove eq "R"){
		$self->{_payoff} += 60;
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "W";
	}

	#retreat if exceeded the max moves
	if($self->{_moveNumber} > $self->{_MAX_MOVES}){
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "R";
	}

	$self->{_moveNumber}++;
	#plays D if gets response as C from the opponent after giving it a probe
	if($self->{_escalate} == 1 && $opponentsMove eq "C"){
		$self->{_his_last_move}=$opponentsMove;
		$self->{_my_last_move} = "D";
		return "D";	
	}

	#playing 1st move or responding to C with high probability plays C and with low plays D
	if($opponentsMove eq "" || $opponentsMove eq "C"){
		if(escalate($self->{_PROBABILITY_ESCALATE})){
			$self->{_escalate} = 1;
			return "D";
		}
		return "C";
	}else{
	#reply is D
		if(injured($self->{_PROBABILITY_INJURY})==1){
			#print "Injured";
			#injury -100
			$self->{_payoff} -= 100;
			return "R";
		}
		$self->{_payoff} -= 2;
		if($self->{_escalate} == 1){
			$self->{_escalate} = 0;
			return "C";
		}
		#if probing on the opening move or opponent playing C with low probability play C and with high play D
		if(retaliate($self->{_PROBABILITY_RETALIATE}) == 1){
			return "D";
		}
		else{
			return "C";
		}
	}
}

#calculate the probability to escalate
sub escalate{
	my $PROBABILITY_ESCALATE = shift @_;
	my $numb=int(rand(101))/100;
	if($numb<=$PROBABILITY_ESCALATE){
		return 1;
	}
	return 0;
}

#calculate serious injury
sub injured{
	my $PROBABILITY_INJURY = shift @_;
	my $numb=int(rand(101))/100;
	if($numb <= $PROBABILITY_INJURY){
		return 1;
	}
	return 0;
}

#calculate retaliate probability
sub retaliate{
	my $PROBABILITY_RETALIATE = shift @_;
	my $numb=int(rand(100))/100;
	if($numb <= $PROBABILITY_RETALIATE){
		return 1;
	}
	return 0;
}

#calculate pay off for time and energy saved
sub saving{
	$moveNumber = shift @_;
	if($moveNumber <= 20){
		if($moveNumber > 2){
			return  20-$moveNumber;
		}
		return 20;
	}
}

#calculate average pay off
sub avg_payoff{
	my ($self)=@_;
	return $self->{_payoff}/$self->{_totalFights};
}


1;
