/*
* Copyright 2007-2010 the original author or authors.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
package org.as3commons.bytecode.emit.impl {
	import flash.system.ApplicationDomain;

	import flexunit.framework.TestCase;

	import org.as3commons.bytecode.abc.BaseMultiname;
	import org.as3commons.bytecode.abc.InstanceInfo;
	import org.as3commons.bytecode.abc.LNamespace;
	import org.as3commons.bytecode.abc.MethodInfo;
	import org.as3commons.bytecode.abc.MethodTrait;
	import org.as3commons.bytecode.abc.QualifiedName;
	import org.as3commons.bytecode.abc.enum.MultinameKind;
	import org.as3commons.bytecode.abc.enum.NamespaceKind;
	import org.as3commons.bytecode.as3commons_bytecode;
	import org.as3commons.bytecode.emit.IClassBuilder;

	public class ClassBuilderTest extends TestCase {

		private var _classBuilder:ClassBuilder;

		public function ClassBuilderTest(methodName:String = null) {
			super(methodName);
		}

		override public function setUp():void {
			super.setUp();
			_classBuilder = new ClassBuilder();
		}

		/*public function testBuild():void {
			fail("Test method Not yet implemented");
		}*/

		public function testDefineConstructorWithExistingInstance():void {
			var instanceInfo:InstanceInfo = new InstanceInfo();
			instanceInfo.superclassMultiname = new QualifiedName("supertest", new LNamespace(NamespaceKind.PACKAGE_NAMESPACE, "com.classes"), MultinameKind.QNAME);
			instanceInfo.classMultiname = new QualifiedName("test", new LNamespace(NamespaceKind.PACKAGE_NAMESPACE, "com.classes"), MultinameKind.QNAME);
			instanceInfo.instanceInitializer = new MethodInfo();
			instanceInfo.instanceInitializer.as3commonsByteCodeAssignedMethodTrait = new MethodTrait();
			var traitMultiname:QualifiedName = new QualifiedName("testmethod", new LNamespace(NamespaceKind.PACKAGE_NAMESPACE, "com.classes"));
			instanceInfo.instanceInitializer.as3commonsByteCodeAssignedMethodTrait.traitMultiname = traitMultiname;
			_classBuilder.as3commons_bytecode::setInstanceInfo(instanceInfo);
			var arr:Array = _classBuilder.build(ApplicationDomain.currentDomain);
			var inst:InstanceInfo = arr[1];
			assertStrictlyEquals(inst, instanceInfo);
			assertStrictlyEquals(inst.instanceInitializer, instanceInfo.instanceInitializer);
			assertStrictlyEquals(inst.instanceInitializer.as3commonsByteCodeAssignedMethodTrait, instanceInfo.instanceInitializer.as3commonsByteCodeAssignedMethodTrait);
		}

	/*public function testDefineProperty():void {
		fail("Test method Not yet implemented");
	}

	public function testImplementInterface():void {
		fail("Test method Not yet implemented");
	}

	public function testImplementInterfaces():void {
		fail("Test method Not yet implemented");
	}*/
	}
}