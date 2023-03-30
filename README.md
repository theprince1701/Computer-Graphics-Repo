# Computer Graphics Repo




# PDF:

[Untitled document.pdf](https://github.com/theprince1701/Computer-Graphics-Repo/files/11092732/Untitled.document.pdf)


# Code Explanations

![810e27ac4eef654d501b0811c1c87c7d](https://user-images.githubusercontent.com/96841021/228716553-441ba310-0c13-422c-9c27-22fadd2aba26.png)




This code produces custom shadows. First of all, there are properties to control the color of the shadow, and the object's texture and colour.

This shader uses the lambert lighting model, which calculates the diffuse lighting of the object. First of all, the shader calculates the light intensity by the “fixed diff = max(0, dot(s.Normal, lightDir)). This line is essential because light cannot be darker then black, so we have to get the maximum between 0 and the dot product of the fragment normal and the direction of the light. Additionally, the shader applies the colour of the shadow by adding it to the output colour with a weight of (1- atten), where atten is the light attenuation factor.

Lastly, the shader gives the object a texture in the surf function and sets the colour and alpha.


![36a5af909cc371be5a0494e28b3c9db8](https://user-images.githubusercontent.com/96841021/228716557-f6f1b321-a022-4064-b976-0346f80213b6.png)



This code is for a post processing effect that applies a downsampling filter to a RenderTexture source and then performs blur using an iterative process.

