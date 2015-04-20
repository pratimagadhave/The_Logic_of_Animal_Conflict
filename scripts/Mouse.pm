#!/usr/bin/perl
# Ruturaj and Pratima
# 
# Mouse.pm

#declare a class
package Mouse;

#subroutine with a constructor to assign the variables with the parameters passed
sub new
{
	my $class = shift;
	$self = {
		_MAX_MOVES => shift,
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
	$opponentsMove = $_[1];
	
	#if winner calculate payoff
	if($opponentsMove eq "R"){
		$self->{_payoff} += 60;
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "W";
	}

	#retreats if receives D
	if($opponentsMove eq "D"){
		#--2 payoff
		$self->{_payoff} -= 2;
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "R";
	} 

	#retreats if exceeded max moves else always play C
	if($self->{_moveNumber} > $self->{_MAX_MOVES}){	
		$self->{_payoff} += saving($self->{_moveNumber} );
		return "R";
	}

	$self->{_moveNumber}++;
	return "C";
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
