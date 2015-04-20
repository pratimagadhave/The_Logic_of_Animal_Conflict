#!/usr/bin/perl
# Ruturaj and Pratima
# 
# Retaliator.pm

#declare a class
package Retaliator;

#subroutine with a constructor to assign the variables with the parameters passed
sub new
{
	my $class = shift;
	$self = {
		_MAX_MOVES => shift,
		_PROBABILITY_RETALIATE => shift,
		_PROBABILITY_INJURY => shift,
		_payoff => 0,
		_moveNumber => 0,
		_totalFights => 0,
	};
	bless $self, $class;
	return $self;
}

#subroutine to set the initial values for move number and increment the fight count
sub newFight
{
	my ($self)=@_;
	$self->{_moveNumber}=0;
	++$self->{_totalFights};
}

#subroutine to play the next move based on the rules
sub next_move{
	my ($self)=@_;
	($opponentsMove) = $_[1];

	#if winner calculate pay off
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

	#play C in respond to C
	if($opponentsMove eq "C"){
		return "C";
	}

	#if playing the first move
	if($opponentsMove eq ""){
		return "C";
	}

	#opponent has played D
	if(injured($self->{_PROBABILITY_INJURY})==1){
		#pay off -100
		$self->{_payoff} -= 100;
		return "R";
	}

	$self->{_payoff} -= 2;

	#probability to retaliate on probe is 1.0
	if(retaliate($self->{_PROBABILITY_RETALIATE})){
		return "D";
	}else{
		return "C";			
	}
}

#calculate serious injury
sub injured{
	$PROBABILITY_INJURY = shift @_;
	my $numb=int(rand(101))/100;
	if($numb <= $PROBABILITY_INJURY){
		return 1;
	}
	return 0;
}

#calculate retaliate probability
sub retaliate{
	$PROBABILITY_RETALIATE = shift @_;
	$numb=int(rand(101))/100;
	if($PROBABILITY_RETALIATE){
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
