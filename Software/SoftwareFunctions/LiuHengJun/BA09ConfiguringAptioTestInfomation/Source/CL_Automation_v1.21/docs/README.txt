Cash shell documentation


INITIALIZATION:
	Centralink v15
	* Run initWin2k3.bat (in the root) to initialize all scripts for Win2k3 OS
		* Win2k3 is only supported to audit the Centralink v15 server on the Windows 2003 OS
		* The shortcut created is used to extract all relevant information from the Centralink
		  server for upgrading to Windows 2008 R2
	* Run initWin2k8.bat (in the root) to initialize all scripts for Win2k8 OS

	
ORDER OF OPERATIONS:
	Centralink v15
		* If upgrade from Centralink v15 on Win2k3 OS
			* step_0_auditWin2k3 
				Extract all relavent data from OS and Centralink before upgrade
			* Perform documented hardware changes 
		* New install and upgrade
			* step_1_initWin2k8_A
				Disable the UAC 
			* step_2_setSiteSpecificData
				Configure all site data specific data
					In the case of Win2k3 upgrade the [NETWORK], [SRS], and [HEMATOLOGY] sections will be filled out
			* step_3_initWin2k8_B
				Perform all OS initialization necessary for Centralink installation
			* step_4_confWin2k8
				Perform all OS configuration necessary for Centralink installation
			* step_5_installSRS
				Install and configure all components necessary for SRS 
			* step_6_installProgress
				Invoke the Progress installer
			* step_7_installCentralinkBase
				Invoke the Centralink 15.1.6 release
			* step_8_installCentralinkV15.0.3
				Invoke the Centralink 15.0.3 release
			* step_9_postCentralinkInstall
				Perform all configuration after Centralink has been installed
						
			* optional_confNTPServer
				Configures the Centralink server to be an NTP server
			* optional_enableBasicRDS
				Enables basic (2 or less users) Remote Desktop Services support
			optional_installHematology
				Installs the Cerberus software and creates the hematology directories defined in the site data
				NOTE - the installSRS script must be run to setup the FTP server role
			optional_installCentralinkOpGuide
				Invoke the Centralink Operators Guide
			optional_installMcAfee
				Invoke the McAfee Antivirus software

				
				

LICENSES:
=====================================================================================
Newtonsoft.Json.7.0.1
=====================================================================================
The MIT License (MIT)

Copyright (c) 2007 James Newton-King

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
=====================================================================================
=====================================================================================


=====================================================================================
DotNetZip.1.9.6
=====================================================================================
Software Licenses that apply to the DotNetZip library and tools

As DotNetZip includes work derived from other projects, you are required to comply with the terms and conditions for each of them. These licenses include BSD, Apache, and zlib.

To use the software, you must accept the licenses. If you do not accept the licenses, do not use the software.

Original intellectual property in DotNetZip is provided under the Ms-PL:
    
    Copyright (c) 2006 - 2011 Dino Chiesa 
    Copyright (c) 2006, 2007, 2008, 2009 Dino Chiesa and Microsoft Corporation. 
    
    Microsoft Public License (Ms-PL)
    
    This license governs use of the accompanying software, the DotNetZip library ("the software"). If you use the software, you accept this license. If you do not accept the license, do not use the software.
    
    1. Definitions
    
    The terms "reproduce," "reproduction," "derivative works," and "distribution" have the same meaning here as under U.S. copyright law.
    
    A "contribution" is the original software, or any additions or changes to the software.
    
    A "contributor" is any person that distributes its contribution under this license.
    
    "Licensed patents" are a contributor's patent claims that read directly on its contribution.
    
    2. Grant of Rights
    
    (A) Copyright Grant- Subject to the terms of this license, including the license conditions and limitations in section 3, each contributor grants you a non-exclusive, worldwide, royalty-free copyright license to reproduce its contribution, prepare derivative works of its contribution, and distribute its contribution or any derivative works that you create.
    
    (B) Patent Grant- Subject to the terms of this license, including the license conditions and limitations in section 3, each contributor grants you a non-exclusive, worldwide, royalty-free license under its licensed patents to make, have made, use, sell, offer for sale, import, and/or otherwise dispose of its contribution in the software or derivative works of the contribution in the software.
    
    3. Conditions and Limitations
    
    (A) No Trademark License- This license does not grant you rights to use any contributors' name, logo, or trademarks.
    
    (B) If you bring a patent claim against any contributor over patents that you claim are infringed by the software, your patent license from such contributor to the software ends automatically.
    
    (C) If you distribute any portion of the software, you must retain all copyright, patent, trademark, and attribution notices that are present in the software.
    
    (D) If you distribute any portion of the software in source code form, you may do so only under this license by including a complete copy of this license with your distribution. If you distribute any portion of the software in compiled or object code form, you may only do so under a license that complies with this license.
    
    (E) The software is licensed "as-is." You bear the risk of using it. The contributors give no express warranties, guarantees or conditions. You may have additional consumer rights under your local laws which this license cannot change. To the extent permitted under your local laws, the contributors exclude the implied warranties of merchantability, fitness for a particular purpose and non-infringement. 

--------------------------------------------------------------

The managed ZLIB code included in Ionic.Zlib.dll and Ionic.Zip.dll is derived from jzlib.

jzlib ( https://github.com/ymnk/jzlib ) is provided under a BSD-style (3 clause)

    Copyright (c) 2000,2001,2002,2003 ymnk, JCraft, Inc.

    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    1.	Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    2.	Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    3.	The names of the authors may not be used to endorse or promote products derived from this software without specific prior written permission.
    THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL JCRAFT, INC. OR ANY CONTRIBUTORS TO THIS SOFTWARE BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

--------------------------------------------------------------

The jzlib library, itself, is a re-implementation of ZLIB v1.1.3 in pure Java.

zlib is provided under the zlib license:

    Copyright (C) 1995-2004 Jean-loup Gailly and Mark Adler
    The ZLIB software is provided 'as-is', without any express or implied warranty.  In no event will the authors be held liable for any damages arising from the use of this software.
    Permission is granted to anyone to use this software for any purpose, including commercial applications, and to alter it and redistribute it freely, subject to the following restrictions:
    1.	The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required. 
    2.	Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software. 
    3.	This notice may not be removed or altered from any source distribution.
      Jean-loup Gailly      jloup@gzip.org   Mark Adler      madler@alumni.caltech.edu

--------------------------------------------------------------

The managed BZIP2 code included in Ionic.BZip2.dll and Ionic.Zip.dll is modified code, based on Java code in the Apache commons compress library.

Apache Commons Compress ( http://commons.apache.org/proper/commons-compress/ ) is provided under the Apache 2 license:
    Apache Commons Compress
    Copyright 2002-2014 The Apache Software Foundation

    Licensed to the Apache Software Foundation (ASF) under one or more contributor license agreements.  See the NOTICE file distributed with this work for additional information regarding copyright ownership.  The ASF licenses this file to you under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.  You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the specific language governing permissions and limitations under the License.

Many thanks to Julian Seward for the original C implementation of BZip2 ( http://www.bzip.org/ ).
=====================================================================================
=====================================================================================
