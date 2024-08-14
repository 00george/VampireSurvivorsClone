using Godot;
using System;

public partial class CharacterStats : Resource
{
	[Export]
	public float Attack { get; set; } = 1.0f;

	[Export]
	public float Defence { get; set; } = 1.0f;

	[Export]
	public float Speed { get; set; } = 1.0f;

	[Export]
	public float ExpGain { get; set; } = 1.0f;
}
