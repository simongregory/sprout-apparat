/**
 * This file originates from the Flexmojos project under the following licence:
 *
 * Flexmojos is a set of maven goals to allow maven users to compile, optimize
 * and test Flex SWF, Flex SWC, Air SWF and Air SWC.
 * Copyright (C) 2008-2012 Marvin Froeder <marvin@flexmojos.net>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package apparat.coverage
{

public final class Coverage
{
    private static var _coverage:CoverageDataCollector;
    private static function get coverage():CoverageDataCollector
    {
        if (_coverage == null) _coverage = new CoverageDataCollector()
        return _coverage
    }

    private static var cache:Object = {}

    public static function onSample(file:String, line:int):void
    {
        if (cache[file] == null) cache[file] = []
        if (contains(cache[file], line)) return

        cache[file].push(line)

        coverage.collect(file, line)
    }

    public static function toXml():void
    {
        var data:Object = coverage.result();
        for ( var cls:String in data )
        {
            trace(data[cls].toXml())
        }
    }

    private static function contains(array:Array, item:*):Boolean
    {
        return (array.indexOf(item) != -1)
    }
}
}

internal class CoverageDataCollector
{
    private var map:Object = {}

    public function collect(classname:String, lineNumber:int):void
    {
        var data:TestCoverageReport

        if ((data = map[classname]) == null)
        {
            data = new TestCoverageReport(classname);
            map[classname] = data;
        }

        data.touch(lineNumber)
    }

    public function result():Object
    {
        var result:Object = map
        map = {}
        return result
    }
}

internal class TestCoverageReport
{
    public var classname:String
    public var touched:Array = []

    public function TestCoverageReport(classname:String)
    {
        this.classname = classname;
    }

    public function touch(lineNumber:int):void
    {
        touched.splice(touched.length, 0, lineNumber)
    }

    public function toXml():String
    {
        var genxml:String = "<coverage classname=\""+ classname + "\">";

        for each ( var line:int in touched )
        {
              genxml = genxml.concat("<touch>",line,"</touch>");
        }

        genxml += "</coverage>";

        return genxml;
    }
}
