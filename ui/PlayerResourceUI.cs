using Godot;
using System;

public partial class PlayerResourceUI : Resource
{	

	[Export]
	public String Name { get; set; }

	[Export]
	public Texture2D Icon { get; set; }

}
