using Godot;
using System;

public partial class WeaponInformation : Resource
{

	[Export]   
	public String WeaponName {get; set; } = "weapon";

	[Export]   
	public Texture2D WeaponIcon {get; set; }

	[Export]   
	public String WeaponDescription {get; set; }
}
