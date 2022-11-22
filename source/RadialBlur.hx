package;

import flixel.*;
import flixel.system.FlxAssets.FlxShader;
/**
 * ...
 * @author bbpanzu
 */
class RadialBlur extends FlxShader
{

	@:glFragmentSource('
		#pragma header

	uniform float cx;
	uniform float cy;
  uniform float blurWidth;
	
	const int nsamples = 30;
	
	void main(){
	  #pragma body
		vec4 color = texture2D(bitmap, openfl_TextureCoordv);
			vec2 res;
			res = openfl_TextureCoordv;
		vec2 pp;
		pp = vec2(cx, cy);
		vec2 center = pp.xy /res.xy;
		float blurStart = 1.0;

		vec2 uv = openfl_TextureCoordv.xy;

		uv -= center;
		float precompute = blurWidth * (1.0 / float(nsamples - 1));
		
		for(int i = 0; i < nsamples; i++)
		{
			float scale = blurStart + (float(i)* precompute);
		col += texture2D(bitmap, uv * scale + center);
		}

		col /= float(nsamples);
		
		gl_FragColor = color; 
	
	}')
	public function new()
	{
		super();
		cx.value = [0.0];
		cy.value = [0.0];
		blurWidth = [10.0];
	}
}