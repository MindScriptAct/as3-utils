package mindscriptact.utils.geom {
public class Vect2d {

	/** Epsilon (maximum error for comparisons) */
	public static const EPSILON:Number = 0.0000001;

	/** Epsilon squared */
	public static const EPSILON_SQRT:Number = EPSILON * EPSILON;


	/////

	public var x:Number;

	public var y:Number;

	/**
	 * CONSTRUCTOR
	 * @param x        initial x
	 * @param y        initial y
	 */
	public function Vect2d(x:Number = 0, y:Number = 0) {
		this.x = x;
		this.y = y;
	}

	/**
	 * Creates clone of self
	 * @return    new Vect2d object with same values.
	 */
	public function clone():Vect2d {
		return new Vect2d(x, y);
	}

	/** Sets x and y */
	public function set(x:Number, y:Number):Vect2d {
		this.x = x;
		this.y = y;

		return this;
	}

	/** Sets components converting from polar coords */
	public function setFromPolar(rads:Number, length:Number):Vect2d {
		var s:Number = Math.sin(rads);
		var c:Number = Math.cos(rads);
		x = c * length;
		y = s * length;

		return this;
	}

	/** Sets x and y from Vect2d */
	public function setFromVect(vect:Vect2d):Vect2d {
		x = vect.x;
		y = vect.y;

		return this;
	}


	/**
	 * Add another vector
	 * @param vect
	 * @return
	 */
	public function add(vect:Vect2d):Vect2d {
		x = x + vect.x;
		y = y + vect.y;
		return this;
	}

	/**
	 * Subtract another vector.
	 * @param vect
	 * @return
	 */
	public function sub(vect:Vect2d):Vect2d {
		x = x - vect.x;
		y = y - vect.y;
		return this;
	}

	/**
	 * vector scalar multiplication.
	 * @param scalar
	 * @return
	 */
	public function mulScalar(scalar:Number):Vect2d {
		x = x * scalar;
		y = y * scalar;
		return this;
	}

	// scalar division.
	public function divScalar(scalar:Number):Vect2d {
		x = x / scalar;
		y = y / scalar;
		return this;
	}

	// same as setting length to 1
	public function normalize():Vect2d {
		var nf:Number = 1 / Math.sqrt(x * x + y * y);
		x = x * nf;
		y = y * nf;
		return this;
	}

	/** Offsets to x and y */
	public function offset(xOffset:Number, yOffset:Number):Vect2d {
		x = x + xOffset;
		y = y + yOffset;
		return this;
	}

	/**
	 * vector angle.
	 */
	public function get angle():Number {
		return Math.atan2(y, x);
	}

	/**
	 * Changes vector length - recalculates x and y.
	 * @param value
	 */
	public function set length(value:Number):void {
		var nf:Number = value / Math.sqrt(x * x + y * y);
		x = x * nf;
		y = y * nf;
	}

	/**
	 * Length of vector.
	 */
	public function get length():Number {
		return Math.sqrt(x * x + y * y);
	}

	/**
	 * Length of vector squared, for quicker comparisons.
	 */
	public function get lengthSquared():Number {
		return x * x + y * y;
	}

	/**
	 * Distance to another vector.
	 * @param toVec
	 * @return
	 */
	public function distanceTo(toVec:Vect2d):Number {
		var xd:Number = x - toVec.x;
		var yd:Number = y - toVec.y;
		return Math.sqrt(xd * xd + yd * yd);
	}

	/**
	 * Distance to another vector squared, for quicker comparisons.
	 * @param toVec
	 * @return
	 */
	public function distanceToSquared(toVec:Vect2d):Number {
		var xd:Number = x - toVec.x;
		var yd:Number = y - toVec.y;
		return xd * xd + yd * yd;
	}

	public function equals(vect:Vect2d):Boolean {
		return x == vect.x && y == vect.y;
	}


	/** Rotates by "rads" radians (returns a new Vec2) */
	public function rotate(rads:Number):Vect2d {
		var s:Number = Math.sin(rads);
		var c:Number = Math.cos(rads);

		var xTemp:Number = x * c - y * s;
		y = x * s + y * c;
		x = xTemp;

		return this;
	}

	/**
	 * flips vector. (same as scalar multiplication by -1)
	 * @return
	 */
	public function flip():Vect2d {
		x = x * -1;
		y = y * -1;
		return this;
	}

	/** Clamps vector x and y between min and max values */
	public function clampBetween(xMin:Number, yMin:Number, xMax:Number, yMax:Number):Vect2d {
		if (x < xMin) {
			x = xMin;
		} else if (x > xMax) {
			x = xMax;
		}
		if (y < yMin) {
			y = yMin;
		} else if (y > yMax) {
			y = yMax;
		}
		return this;
	}

	/** Linear interpolation from this vector to "toVect" vector, at "t" representing positien. (for example: 0.5 is a middle ). */
	public function interpolateTo(toVect:Vect2d, t:Number):Vect2d {
		x = x + t * (toVect.x - x);
		y = y + t * (toVect.y - y);
		return this;
	}


	/** Returns true if this vector is normalized (length == 1) */
	public function isNormalized():Boolean {
		return Math.abs((x * x + y * y) - 1) == Vect2d.EPSILON_SQRT;
	}

	/** Returns true if this vector's components are 0 */
	public function isZero():Boolean {
		return (x == 0 && y == 0);
	}

	//-----------------------------------
	//  math stuff, (uncomment if you know what to do with it..).
	//-----------------------------------

	//** Computes the dot product with "vect" vector */
	//	public function dotProduct(vect:Vec2d):Number {
	//		return x * vect.x + y * vect.y;
	//	}

	//** Computes the cross product (determinant) with "vect" */
	//	public function crossProductDeterminant(vect:Vec2d):Number {
	//		return x * vect.y - y * vect.x;
	//	}

	//** Rotates using spinor vector */
	//public function rotateUsingSpinor(vect:Vec2d):Vec2d {
	//  var xTemp:Number = x * vect.x - y * vect.y;
	//	y = x * vect.y + y * vect.x
	//	x = xTemp;
	//	return this;
	//}

	public function toString():String {
		return "Vect2d{" + x + "." + y + "}";
	}

	//-----------------------------------
	// static stuff
	//-----------------------------------

	/**
	 * Gets a distance between 2 vectors.
	 * @param fromVec
	 * @param toVec
	 * @return
	 */
	static public function distance(fromVec:Vect2d, toVec:Vect2d):Number {
		var xd:Number = fromVec.x - toVec.x;
		var yd:Number = fromVec.y - toVec.y;
		return Math.sqrt(xd * xd + yd * yd);
	}

	/**
	 * Gets a distance between 2 vectors, squared, for quicker comparisons.
	 * @param fromVec
	 * @param toVec
	 * @return
	 */
	static public function distanceSquared(fromVec:Vect2d, toVec:Vect2d):Number {
		var xd:Number = fromVec.x - toVec.x;
		var yd:Number = fromVec.y - toVec.y;
		return xd * xd + yd * yd;
	}

	/** Returns a new Vect2d right-perpendicular to this vector. (same as rotating 90 angle right) */
	static public function getRightperPendicular(vect:Vect2d):Vect2d {
		return new Vect2d(-vect.y, vect.x);
	}

	/** Returns a new Vect2d left-perpendicular to this vector. (same as rotating 90 angle left)*/
	static public function getLeftPerpendicular(vect:Vect2d):Vect2d {
		return new Vect2d(vect.y, -vect.x);
	}

	/** Reflect vector from plane with provided normal (returns a new Vec2d)
	 * http://mathworld.wolfram.com/images/eps-gif/Reflection2_751.gif
	 * */
	static public function getReflect(vect:Vect2d, normal:Vect2d):Vect2d {
		var d:Number = 2 * (vect.x * normal.x + vect.y * normal.y);
		return new Vect2d(vect.x - d * normal.x, vect.y - d * normal.y);
	}

	/** Swaps values of two vectors */
	static public function swap(vectA:Vect2d, vectB:Vect2d):void {
		const x:Number = vectA.x;
		const y:Number = vectA.y;
		vectA.x = vectB.x;
		vectA.y = vectB.y;
		vectB.x = x;
		vectB.y = y;
	}

	/** Returns true if vector's components are 0 */
	static public function isZero(vect:Vect2d):Boolean {
		return (vect.x == 0 && vect.y == 0);
	}

	/** Returns true if 2 vectors are in almost same place. (with possible Vect2d.EPSILON error) */
	static public function isNear(vect1:Vect2d, vect2:Vect2d):Boolean {
		var xd:Number = vect1.x - vect2.x;
		var yd:Number = vect1.y - vect2.y;
		return Math.sqrt(xd * xd + yd * yd) < Vect2d.EPSILON_SQRT;
	}


}
}
