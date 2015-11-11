# SNDSpriteDestroy
A library that's useful in making a sprite explode. Written in Swift. 

![My image](http://stanmation.github.io/img/explosion.gif)

#### Add SNDSpriteDestroy to your project 

__Step 1.__  Add and copy "SpriteDestroy.swift" into your project.

__Step 2.__  In your GameScene, inside the method that will trigger the explosion of your sprite, create an instance of "SpriteDestroy()". 

__Step 3.__ Then call the method "createSpritePieces(sprite:SKSpriteNode, totalSegments:Int, multiplier:CGFloat)" where:
* sprite: the sprite that you want to destroy.
* totalSegments: how many pieces your sprite is scattered into (can only be even number above 0).
* multiplier: how big the impact of the explosion (the bigger the number, the bigger the impact is).

#### Contact
If you have any question or feedback, do not hesitate to contact me at stanmation@gmail.com
