#!/usr/bin/perl -w
# Ruturaj and Pratima
# 
# Bully.pm

#declare a class
package Bully;

#subroutine with a constructor to assign the variables with the parameters passed
sub new
{
	my $class = shift;
	$self = {
		_PROBABILITY_INJURY => shift,
		_payoff => 0,
		_moveNumber => 0,
		_totalFights => 0,
		_numbofD => 0,
	};
	bless $self, $class;
	return $self;
}

#subroutine to set the initial values for move number and number of D received and increment the fight count
sub newFight
{
	my ($self)=@_;
	$self->{_moveNumber}=0;
	$self->{_numbofD}=0;
	++$self->{_totalFights};
}

#subroutine to play the next move based on the rules
sub next_move{
	my ($self)=@_;
	($opponentsMove) = $_[1];
	$self->{_moveNumber}++;

	#if received 2 consecutive D retreat
	if($self->{_numbofD} == 1 && $opponentsMove eq "D"){
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "R";
	}

	#starts withh D if playing the first move
	if($opponentsMove eq ""){
		return "D";
	}

	#if winner calculate the payoff
	if($opponentsMove eq "R"){
		$self->{_payoff} += 60;
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "W";
	}

	#plays D if received C; or plays C if received the single D
	if($opponentsMove eq "C"){
		return "D";
	}else{		
		if(injured($self->{_PROBABILITY_INJURY})==1){
			#-- 100 payoff
			$self->{_payoff} -= 100;
			return "R";
		}
		$self->{_payoff} -= 2;
		$self->{_numbofD} += 1;
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
