using Godot;
using System;

public partial class PlayerExp : Node
{
	public float Exp = 0f;

	public int Level = 0;

	public float ExpCap = 10f;

	public const float LevelThresholdMultiplier = 1.5f;

	[Signal]
	public delegate void LevelUpEventHandler();

	public void GainExp(int Amount, float expModifier)
	{
		Exp += Amount * expModifier;

		if(Exp >= ExpCap)
		{
			Level += 1;
			Exp -= ExpCap;
			ExpCap *= LevelThresholdMultiplier;
			GetParent().GetParent().GetParent().GetNode<LevelUpManger>("LevelUpManager").OnLevelUp();
		}
	}
}
