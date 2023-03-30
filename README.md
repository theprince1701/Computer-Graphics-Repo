# Computer Graphics Repo




# PDF:

[Untitled document.pdf](https://github.com/theprince1701/Computer-Graphics-Repo/files/11092732/Untitled.document.pdf)


# Code Explanations

![810e27ac4eef654d501b0811c1c87c7d](https://user-images.githubusercontent.com/96841021/228716553-441ba310-0c13-422c-9c27-22fadd2aba26.png)




This code produces custom shadows. First of all, there are properties to control the color of the shadow, and the object's texture and colour.

This shader uses the lambert lighting model, which calculates the diffuse lighting of the object. First of all, the shader calculates the light intensity by the “fixed diff = max(0, dot(s.Normal, lightDir)). This line is essential because light cannot be darker then black, so we have to get the maximum between 0 and the dot product of the fragment normal and the direction of the light. Additionally, the shader applies the colour of the shadow by adding it to the output colour with a weight of (1- atten), where atten is the light attenuation factor.

Lastly, the shader gives the object a texture in the surf function and sets the colour and alpha.


![36a5af909cc371be5a0494e28b3c9db8](https://user-images.githubusercontent.com/96841021/228716557-f6f1b321-a022-4064-b976-0346f80213b6.png)



This code is for a post processing effect that applies a downsampling filter to a RenderTexture source and then performs blur using an iterative process. The downsampling works by looping through a pre-defined iteration amount (more iterations means more downsampling/blur). 

Inside the loop, the script divides the screen height, and width to downsample the resolution of the current image of the screen. Next, the script will check if the screen height is now <= 2 because the height of most displays are usually smaller than the weight.

After the downsampling is finished, the script begins looping through the stored array RenderTextures set when we did the iteration looping, from the second last element to the first. Graphics.Blit is now used to copy the source to the destination.

Finally the script then uses Graphics.Blit to copy the source to the destination to create the final image being rendered onto the screen.

# Explaining The Water Shader

![d19eb848c5ad01fad666f313eba87a48](https://user-images.githubusercontent.com/96841021/228719266-aad7e537-f75a-42aa-ba3b-dc3e0bd03b8f.png)


The water shader works by scrolling two normal maps in the opposite direction to give the illusion of moving waves.

First, the shader defines two normal maps, and scrolling directions (x, y) for the two wave settings.

The shader then makes variables for the each variable in the properties, and gets the UV'S in the Input struct. 

In the surf function, it defines two uv coord (float2) for each of the normal variables, the uv coords are then scrolled by adding a direction multiplied by Time to move the uv coordinates over time in a given direction.

Finally the shader then unpacks the normals, by the tex2D function with the specified normals, and sets the normal of the Output to the wave normals.

