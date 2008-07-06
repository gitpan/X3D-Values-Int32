#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

typedef SV* SELF;
typedef I32 X3D__Values__Int32;

#define MIN_INT32 ((I32)0x80000000)
#define MAX_INT32 ((I32)0x7fffffff)

/*warn("integer overflow in expression");*/

I32 atoi32(const char* s) {
	I32 v=0;
	int sign=1;
	while ( *s == ' ' || (unsigned int)(*s - 9) < 5u) ++s;
	switch (*s) {
		case '-': sign = -1;
		case '+': ++s;
	}
	while ((unsigned int) (*s - '0') < 10u) {
		v = v*10 + *s-'0';
		++s;
	}
	return sign == -1 ? -v :  v;
}

MODULE = X3D::Values::Int32		PACKAGE = X3D::Values::Int32		PREFIX = X3DInt32_
PROTOTYPES: DISABLE

################################################################################

# MIN_INT32
I32
X3DInt32_MIN_INT32()
CODE:
	RETVAL = MIN_INT32;
OUTPUT:
	RETVAL

# MAX_INT32
I32
X3DInt32_MAX_INT32()
CODE:
	RETVAL = MAX_INT32;
OUTPUT:
	RETVAL

################################################################################

# new
X3D::Values::Int32
X3DInt32_new(self, value="0")
	char*	value   
CODE:
	RETVAL = atoi32(value);
OUTPUT:
	RETVAL

################################################################################

# getClone
X3D::Values::Int32
X3DInt32_getClone(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = this;
OUTPUT:
	RETVAL

# setValue
void
X3DInt32_setValue(self, value)
	SELF	self
	char*	value
CODE:
	sv_setiv(self, atoi32(value));
	
# getValue
I32
X3DInt32_getValue(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = this;
OUTPUT:
	RETVAL

################################################################################

# bool
bool
X3DInt32__bool(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = this ? 1 : 0;
OUTPUT:
	RETVAL

################################################################################

# !
bool
X3DInt32__not(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = !this;
OUTPUT:
	RETVAL

################################################################################

# ==
bool
X3DInt32__neq(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
CODE:
	RETVAL = this == value;
OUTPUT:
	RETVAL

# !=
bool
X3DInt32__nne(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
CODE:
	RETVAL = this != value;
OUTPUT:
	RETVAL

# <=>
I32
X3DInt32__ncmp(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
	bool						swap
CODE:
	RETVAL = swap
		? (value < this ? -1 : value > this ? 1 : 0)
		: (this < value ? -1 : this > value ? 1 : 0);
OUTPUT:
	RETVAL

# eq
bool
X3DInt32__eq(this, value, swap=FALSE)
	SV*	this
	SV*	value
CODE:
	RETVAL = sv_eq(this, value);
OUTPUT:
	RETVAL

# ne
bool
X3DInt32__ne(this, value, swap=FALSE)
	SV*	this
	SV*	value
CODE:
	RETVAL = !sv_eq(this, value);
OUTPUT:
	RETVAL

# cmp
I32
X3DInt32__cmp(this, value, swap=FALSE)
	SV*	this
	SV*	value
	bool	swap
CODE:
	RETVAL = swap ? sv_cmp(value, this) : sv_cmp(this, value);
OUTPUT:
	RETVAL

################################################################################

# ~
NV
X3DInt32_complement(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = ~ this;
OUTPUT:
	RETVAL

################################################################################

# &=
SELF
X3DInt32__and(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	sv_setiv(self, (I32)(SvIV(self) & value));
OUTPUT:
SETMAGIC: DISABLE
	self

# |=
SELF
X3DInt32__or(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	sv_setiv(self, (I32)(SvIV(self) | value));
OUTPUT:
SETMAGIC: DISABLE
	self

# |=
SELF
X3DInt32__xor(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	sv_setiv(self, (I32)(SvIV(self) ^ value));
OUTPUT:
SETMAGIC: DISABLE
	self

# <<=
SELF
X3DInt32__sleft(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	sv_setiv(self, (I32)(SvIV(self) << value));
OUTPUT:
SETMAGIC: DISABLE
	self

# >>=
SELF
X3DInt32__sright(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	sv_setiv(self, (I32)(SvIV(self) >> value));
OUTPUT:
SETMAGIC: DISABLE
	self

################################################################################

# &
NV
X3DInt32_and(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
CODE:
	RETVAL = this & value;
OUTPUT:
	RETVAL

# |
NV
X3DInt32_or(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
CODE:
	RETVAL = this | value;
OUTPUT:
	RETVAL

# ^
NV
X3DInt32_xor(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
CODE:
	RETVAL = this ^ value;
OUTPUT:
	RETVAL

# <<
NV
X3DInt32_sleft(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
	bool						swap
CODE:
	RETVAL = swap ? value << this : this << value;
OUTPUT:
	RETVAL

# >>
NV
X3DInt32_sright(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
	bool						swap
CODE:
	RETVAL = swap ? value >> this : this >> value;
OUTPUT:
	RETVAL

################################################################################

NV
X3DInt32_negate(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = - (NV)this;
OUTPUT:
	RETVAL

################################################################################

# ++
SELF
X3DInt32__inc(self, value, swap=FALSE)
  SELF  self
CODE:
	sv_setiv(self, (I32)(SvIV(self) + 1));
OUTPUT:
SETMAGIC: DISABLE
  self

# --
SELF
X3DInt32__dec(self, value, swap=FALSE)
	SELF  self
CODE:
	sv_setiv(self, (I32)(SvIV(self) - 1));
OUTPUT:
SETMAGIC: DISABLE
	self

################################################################################

# +=
SELF
X3DInt32__add(self, value, swap=FALSE)
	SELF  self
	char*	value   
CODE:
	sv_setiv(self, (I32)(SvIV(self) + atoi32(value)));
OUTPUT:
SETMAGIC: DISABLE
  self

# -=
SELF
X3DInt32__subtract(self, value, swap=FALSE)
	SELF  self
	char*	value   
CODE:
	sv_setiv(self, (I32)(SvIV(self) - atoi32(value)));
OUTPUT:
SETMAGIC: DISABLE
	self

# *=
SELF
X3DInt32__multiply(self, value, swap=FALSE)
	SELF	self
	NV		value
CODE:
	sv_setiv(self, (I32)(SvIV(self) * value));
OUTPUT:
SETMAGIC: DISABLE
	self

# /=
SELF
X3DInt32__divide(self, value, swap=FALSE)
	SELF	self
	NV		value
CODE:
	if (value == 0)
		croak("Illegal division by zero");
	sv_setiv(self, (I32)(SvIV(self) / value));
OUTPUT:
SETMAGIC: DISABLE
	self

# %=
SELF
X3DInt32__modulo(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	if (value == 0)
		croak("Illegal modulus zero");
	sv_setiv(self, (I32)(SvIV(self) % value));
OUTPUT:
SETMAGIC: DISABLE
	self

# **=
SELF
X3DInt32__pow(self, value, swap=FALSE)
	SELF	self
	IV		value
CODE:
	sv_setiv(self, (I32)pow(SvIV(self), value));
OUTPUT:
SETMAGIC: DISABLE
	self

################################################################################

# +
NV
X3DInt32_add(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
CODE:
	RETVAL = this + value;
OUTPUT:
	RETVAL

# -
NV
X3DInt32_subtract(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
	bool						swap
CODE:
	RETVAL = swap ? value - this : this - value;
OUTPUT:
	RETVAL
	
# *
NV
X3DInt32_multiply(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
CODE:
	RETVAL = this * value;
OUTPUT:
	RETVAL

# /
NV
X3DInt32_divide(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
	bool						swap
CODE:
	if (swap) {
		if (this == 0)
			croak("Illegal division by zero");
		RETVAL = value / this;
	} else {
		if (value == 0)
			croak("Illegal division by zero");
		RETVAL = this / value;
	}
OUTPUT:
	RETVAL

# %
NV
X3DInt32_modulo(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
	bool						swap
CODE:
	if (swap) {
		if (this == 0)
			croak("Illegal modulus zero");
		RETVAL = value % this;
	} else {
		if (value == 0)
			croak("Illegal modulus zero");
		RETVAL = this % value;
	}
OUTPUT:
	RETVAL

# **
NV
X3DInt32_pow(this, value, swap=FALSE)
	X3D::Values::Int32	this
	NV							value
	bool						swap
CODE:
	RETVAL = swap ? pow(value, this) : pow(this, value);
OUTPUT:
	RETVAL

################################################################################

# abs()
U32
X3DInt32_abs(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = abs(this);
OUTPUT:
	RETVAL

# cos()
NV
X3DInt32_cos(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = cos(this);
OUTPUT:
	RETVAL

# sin()
NV
X3DInt32_sin(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = sin(this);
OUTPUT:
	RETVAL

# exp()
NV
X3DInt32_exp(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = exp(this);
OUTPUT:
	RETVAL
	
# log()
NV
X3DInt32_log(this, ...)
	X3D::Values::Int32	this
CODE:
	if (this <= 0)
		croak("Can't take log of %d", this);
	RETVAL = log(this);
OUTPUT:
	RETVAL

# atan2()
NV
X3DInt32_atan2(this, value, swap)
	X3D::Values::Int32	this
	NV							value
	bool						swap
CODE:
	RETVAL = swap ? atan2(value, this) : atan2(this, value);
OUTPUT:
	RETVAL

# sqrt()
NV
X3DInt32_sqrt(this, ...)
	X3D::Values::Int32	this
CODE:
	if (this < 0)
		croak("Can't take sqrt of %d", this);
	RETVAL = sqrt(this);
OUTPUT:
	RETVAL

#IV
#DESTROY(...)
#CODE:
#  warn("X3DInt32::DESTROY");
#  RETVAL = 0;
#OUTPUT:
#  RETVAL

