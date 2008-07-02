#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

static I32 MIN_INT32;
static I32 MAX_INT32;

typedef SV* SELF;
typedef I32 X3D__Values__Int32;


MODULE = X3D::Values::Int32		PACKAGE = X3D::Values::Int32		PREFIX = X3DInt32_
PROTOTYPES: DISABLE

BOOT:
MIN_INT32 = 1<<31;
MAX_INT32 = 1<<31-1;


################################################################################

X3D::Values::Int32
X3DInt32_new(self, value=0)
	I32	value   
CODE:
	RETVAL = value;
OUTPUT:
	RETVAL

################################################################################

X3D::Values::Int32
X3DInt32_getClone(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = this;
OUTPUT:
	RETVAL

void
X3DInt32_setValue(self, value)
	SELF	self
	I32	value
CODE:
	sv_setiv(self, value);
	
I32
X3DInt32_getValue(this, ...)
	X3D::Values::Int32	this
CODE:
	RETVAL = this;
OUTPUT:
	RETVAL

################################################################################

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
X3DInt32__neq(this, value, swap)
	X3D::Values::Int32	this
	NV							value
CODE:
	RETVAL = this == value;
OUTPUT:
	RETVAL

# !=
bool
X3DInt32__nne(this, value, swap)
	X3D::Values::Int32	this
	NV							value
CODE:
	RETVAL = this != value;
OUTPUT:
	RETVAL

################################################################################

# ~
X3D::Values::Int32
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
CODE:
	RETVAL = this << value;
OUTPUT:
	RETVAL

# >>
NV
X3DInt32_sright(this, value, swap=FALSE)
	X3D::Values::Int32	this
	IV							value
CODE:
	RETVAL = this >> value;
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
	IV 	value
CODE:
	sv_setiv(self, (I32)(SvIV(self) + value));
OUTPUT:
SETMAGIC: DISABLE
  self

# -=
SELF
X3DInt32__subtract(self, value, swap=FALSE)
	SELF  self
	IV 	value
CODE:
	sv_setiv(self, (I32)(SvIV(self) - value));
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
