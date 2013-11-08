<#if bean??>
    <#if !comma??>
        <#assign comma = false>
    </#if>
<#assign attributes = bean.attributes>
package ${package}.iface;

import java.util.*;
import java.io.Serializable;

public interface ${bean.name}I extends Serializable, Cloneable
{
<#list attributes as attribute>
    public ${attribute.type} get${attribute.name?cap_first}();
    public void set${attribute.name?cap_first}(${attribute.type} ${attribute.name});

</#list>
    public ${bean.name}I fromMap(Map h);

    public Map toStringMap();

    public Object[] getDbUpdateQuery();

    public Object[] getDbUpdateQuery(String table_name);

<#list bean.methods as method>
    public ${method.type} ${method.name};
</#list>
}</#if>
