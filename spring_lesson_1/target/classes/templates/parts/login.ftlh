<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="mb-3">
        <label class="form-label"> User Name</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Enter your user name">
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label"> Password </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Enter your password">
            </div>

        </div>
        <#if isRegisterForm>
        <div class="mb-3">
            <label class="form-label"> Email </label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="Enter your email">
            </div>
        </div>
        </#if>

        <input type="hidden" name="_csrf" value="${_csrf.token}" />

<#--        <input type="submit" value="Sign In"/>-->
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <button type="submit" class="btn btn-primary"><#if isRegisterForm>Create<#else>Sign In</#if></button>
    </form>
</#macro>

<#macro logout Init>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary px-3"><#if Init>Sign Out<#else>Sign In</#if></button>

    </form>
</#macro>