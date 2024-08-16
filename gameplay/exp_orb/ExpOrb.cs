using Godot;
using System;

public partial class ExpOrb : Node2D
{

	[Export]
	private int ExpAmount = 10;

	public void OnArea2dBodyEntered(Node body)
	{
		QueueFree();
		if(body is CharacterBody2D)
		{
			PlayerBase playerBase = body.GetNode<PlayerBase>("PlayerBase");
			playerBase.GainExp(ExpAmount);
		}
	}

}
