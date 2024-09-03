using Godot;
using System;

public partial class PlayerExp : Node
{
	private float _exp = 0f;

	private int _level = 0;

	private float _expCap = 20f;

	public const float LevelThresholdMultiplier = 1.25f;

	[Signal]
	public delegate void LevelUpEventHandler();

	public void GainExp(int Amount, float expModifier)
	{
		_exp += MathF.Floor(Amount * expModifier);

		if(_exp >= _expCap)
		{
			_level += 1;
			_exp -= _expCap;
			_expCap = MathF.Floor(_expCap * LevelThresholdMultiplier);
			GetParent().GetParent().GetParent().GetNode<LevelUpManger>("LevelUpManager").OnLevelUp();
		} 
		PlayerIngameUI.Instance.SetExpBar(_exp, _expCap);
	}
	
}
