

# Warning: This is an automatically generated file, do not edit!

if ENABLE_DEBUG
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize- -debug "-define:DEBUG;TRACE"
ASSEMBLY = ../Debug/Microsoft.Z3.dll
ASSEMBLY_MDB = $(ASSEMBLY).mdb
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../Debug/

MICROSOFT_Z3_DLL_MDB_SOURCE=../Debug/Microsoft.Z3.dll.mdb
MICROSOFT_Z3_DLL_MDB=$(BUILD_DIR)/Microsoft.Z3.dll.mdb
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_RELEASE
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = ../external/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../external/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_EXTERNAL
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = ../external/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../external/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_RELEASE_DELAYSIGN
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+ "-define:DELAYSIGN"
ASSEMBLY = ../Release_delaysign/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../Release_delaysign/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_DEBUG_X64
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize- -debug "-define:DEBUG;TRACE"
ASSEMBLY = ../x64/Debug/Microsoft.Z3.dll
ASSEMBLY_MDB = $(ASSEMBLY).mdb
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../x64/Debug/

MICROSOFT_Z3_DLL_MDB_SOURCE=../x64/Debug/Microsoft.Z3.dll.mdb
MICROSOFT_Z3_DLL_MDB=$(BUILD_DIR)/Microsoft.Z3.dll.mdb
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_RELEASE_X64
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = ../x64/external_64/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../x64/external_64/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_EXTERNAL_X64
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = ../x64/external/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = ../x64/external/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_RELEASE_DELAYSIGN_X64
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = bin/x64/Release_delaysign/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = bin/x64/Release_delaysign/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_DEBUG_X86
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize- -debug "-define:DEBUG;TRACE"
ASSEMBLY = bin/x86/Debug/Microsoft.Z3.dll
ASSEMBLY_MDB = $(ASSEMBLY).mdb
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = bin/x86/Debug/

MICROSOFT_Z3_DLL_MDB_SOURCE=bin/x86/Debug/Microsoft.Z3.dll.mdb
MICROSOFT_Z3_DLL_MDB=$(BUILD_DIR)/Microsoft.Z3.dll.mdb
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_RELEASE_X86
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = bin/x86/Release/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = bin/x86/Release/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_EXTERNAL_X86
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+
ASSEMBLY = bin/x86/external/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = bin/x86/external/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

if ENABLE_RELEASE_DELAYSIGN_X86
ASSEMBLY_COMPILER_COMMAND = dmcs
ASSEMBLY_COMPILER_FLAGS =  -noconfig -codepage:utf8 -unsafe -warn:4 -optimize+ "-define:DELAYSIGN"
ASSEMBLY = bin/x86/Release_delaysign/Microsoft.Z3.dll
ASSEMBLY_MDB = 
COMPILE_TARGET = library
PROJECT_REFERENCES = 
BUILD_DIR = bin/x86/Release_delaysign/

MICROSOFT_Z3_DLL_MDB=
MICROSOFT_Z3_DLL_CONFIG_SOURCE=App.config

endif

AL=al
SATELLITE_ASSEMBLY_NAME=$(notdir $(basename $(ASSEMBLY))).resources.dll

PROGRAMFILES = \
	$(MICROSOFT_Z3_DLL_MDB) \
	$(MICROSOFT_Z3_DLL_CONFIG)  

LINUX_PKGCONFIG = \
	$(MICROSOFT_Z3_PC)  


RESGEN=resgen2
	
all: $(ASSEMBLY) $(PROGRAMFILES) $(LINUX_PKGCONFIG) 

FILES = \
	AlgebraicNum.cs \
	ApplyResult.cs \
	ArithExpr.cs \
	ArithSort.cs \
	ArrayExpr.cs \
	ArraySort.cs \
	AST.cs \
	ASTMap.cs \
	ASTVector.cs \
	BitVecExpr.cs \
	BitVecNum.cs \
	BitVecSort.cs \
	BoolExpr.cs \
	BoolSort.cs \
	Constructor.cs \
	ConstructorList.cs \
	DatatypeExpr.cs \
	DatatypeSort.cs \
	Global.cs \
	IDecRefQueue.cs \
	Enumerations.cs \
	EnumSort.cs \
	Expr.cs \
	FiniteDomainSort.cs \
	Fixedpoint.cs \
	FuncDecl.cs \
	FuncInterp.cs \
	Goal.cs \
	IntExpr.cs \
	IntNum.cs \
	IntSort.cs \
	IntSymbol.cs \
	ListSort.cs \
	Model.cs \
	Params.cs \
	ParamDescrs.cs \
	Pattern.cs \
	RatNum.cs \
	RealExpr.cs \
	RealSort.cs \
	RelationSort.cs \
	SetSort.cs \
	Statistics.cs \
	Status.cs \
	Context.cs \
	Probe.cs \
	Solver.cs \
	StringSymbol.cs \
	Tactic.cs \
	TupleSort.cs \
	UninterpretedSort.cs \
	Z3Exception.cs \
	Log.cs \
	Native.cs \
	Properties/AssemblyInfo.cs \
	Quantifier.cs \
	Sort.cs \
	Symbol.cs \
	Version.cs \
	Z3Object.cs 

DATA_FILES = 

RESOURCES = 

EXTRAS = \
	App.config \
	microsoft.z3.pc.in 

REFERENCES =  \
	System \
	System.Core \
	System.Numerics

DLL_REFERENCES = 

CLEANFILES = $(PROGRAMFILES) $(LINUX_PKGCONFIG) 

include $(top_srcdir)/Makefile.include

MICROSOFT_Z3_DLL_CONFIG = $(BUILD_DIR)/Microsoft.Z3.dll.config
MICROSOFT_Z3_PC = $(BUILD_DIR)/microsoft.z3.pc

$(eval $(call emit-deploy-target,MICROSOFT_Z3_DLL_CONFIG))
$(eval $(call emit-deploy-wrapper,MICROSOFT_Z3_PC,microsoft.z3.pc))


$(eval $(call emit_resgen_targets))
$(build_xamlg_list): %.xaml.g.cs: %.xaml
	xamlg '$<'

$(ASSEMBLY_MDB): $(ASSEMBLY)

$(ASSEMBLY): $(build_sources) $(build_resources) $(build_datafiles) $(DLL_REFERENCES) $(PROJECT_REFERENCES) $(build_xamlg_list) $(build_satellite_assembly_list)
	mkdir -p $(shell dirname $(ASSEMBLY))
	$(ASSEMBLY_COMPILER_COMMAND) $(ASSEMBLY_COMPILER_FLAGS) -out:$(ASSEMBLY) -target:$(COMPILE_TARGET) $(build_sources_embed) $(build_resources_embed) $(build_references_ref)
