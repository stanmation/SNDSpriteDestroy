//
//  SpriteDestroy.swift
//  SpriteDestroy
//
//  Created by Stanley Darmawan on 9/11/2015.
//  Copyright © 2015 Stanley Darmawan. All rights reserved.
//

import SpriteKit


class SpriteDestroy: SKSpriteNode {
    
    func createSpritePieces(sprite:SKSpriteNode, totalSegments:Int, multiplier:CGFloat) {
        
        if ((totalSegments % 2) != 0 || totalSegments < 0){
            return
        }
        
        let spriteFadeOut = SKAction.fadeAlphaTo(0.0, duration: 0.01);
        sprite.runAction(spriteFadeOut)
        
        let texture = sprite.texture;
        
        var spritePiece = SKSpriteNode()
        var transVertical:CGFloat
        let transHorizontal:CGFloat = sprite.size.width/4 * multiplier
        
        for var segment=0; segment<totalSegments; segment++ {
            
            let rotateValue = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            
            let segmentFloat =  CGFloat(segment)
            let totalSegmentsHalf = CGFloat(totalSegments/2)
            
            if segment < (totalSegments/2){
                //left part
                
                let subTexture = SKTexture(rect: CGRect(x: 0.0, y: segmentFloat/totalSegmentsHalf, width: 0.5, height: 1/totalSegmentsHalf), inTexture: texture!)
                
                spritePiece = SKSpriteNode(texture: subTexture)
                
                spritePiece.position.x = sprite.position.x - spritePiece.size.width/2
                
                if totalSegments == 2 {
                    spritePiece.position.y = sprite.position.y
                } else {
                    spritePiece.position.y = (sprite.position.y - spritePiece.size.height/2) + segmentFloat * (sprite.size.height/totalSegmentsHalf)
                }
                
                self.addChild(spritePiece)
                
                if (spritePiece.position.y < sprite.position.y) {
                    // pos top
                    transVertical = -sprite.size.height/4 * multiplier
                } else if (spritePiece.position.y > sprite.position.y) {
                    // pos bot
                    transVertical = sprite.size.height/4 * multiplier
                } else {
                    transVertical = 0.0
                }
                
                let animationMove = SKAction.moveByX(-transHorizontal, y: transVertical, duration: 0.3);
                let animationRotate = SKAction.rotateByAngle(rotateValue, duration: 0.5)
                let animationAlpha = SKAction.fadeAlphaTo(0.0, duration: 0.3);
                spritePiece.runAction(SKAction.group([animationMove, animationAlpha, animationRotate]), completion:{
                    spritePiece.removeFromParent()
                })
                
            } else {
                //right part
                
                let subTexture = SKTexture(rect: CGRect(x: 0.5, y: (segmentFloat-totalSegmentsHalf)/totalSegmentsHalf, width: 0.5, height: 1/totalSegmentsHalf), inTexture: texture!)
                
                spritePiece = SKSpriteNode(texture: subTexture)
                
                spritePiece.position.x = sprite.position.x + spritePiece.size.width/2
                
                if totalSegments == 2 {
                    spritePiece.position.y = sprite.position.y
                } else {
                    spritePiece.position.y = (sprite.position.y - spritePiece.size.height/2) + (segmentFloat-totalSegmentsHalf) * (sprite.size.height/totalSegmentsHalf)
                }
                
                self.addChild(spritePiece)
                
                if (spritePiece.position.y < sprite.position.y) {
                    // pos top
                    transVertical = -sprite.size.height/4 * multiplier
                } else if (spritePiece.position.y > sprite.position.y) {
                    // pos bot
                    transVertical = sprite.size.height/4 * multiplier
                } else {
                    transVertical = 0.0
                }
                
                let animationMove = SKAction.moveByX(transHorizontal * multiplier, y: transVertical, duration: 0.3);
                let animationAlpha = SKAction.fadeAlphaTo(0.0, duration: 0.3);
                let animationRotate = SKAction.rotateByAngle(-rotateValue, duration: 0.5)
                spritePiece.runAction(SKAction.group([animationMove, animationAlpha, animationRotate]), completion:{
                    spritePiece.removeFromParent()
                })
            }
        }
    }
}

