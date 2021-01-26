<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="mb-3">
        <label class="form-label"> User Name</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control  ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Enter your user name"  value="<#if user??>${user.username}</#if>">
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>

            </div>
        </div>
        <div class="mb-3">
            <label class="form-label"> Password </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control  ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Enter your password">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>

        </div>
        <#if isRegisterForm>
            <div class="mb-3">
                <label class="form-label"> Confirm your Password </label>
                <div class="col-sm-6">
                    <input type="password" name="password2" class="form-control  ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Retype your password">
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
        <div class="mb-3">
            <label class="form-label"> Email </label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                       placeholder="Enter your email" value="<#if user??>${user.email}</#if>">
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
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