package ${basepackage}.common.filter;


import ${basepackage}.common.wrapper.BodyReaderHttpServletRequestWrapper;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

<#include "/include/author.include"/>

public class HttpServletRequestReplacedFilter implements Filter {
    private static final String ENCODING = "encoding";
    private String encoding;

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        ServletRequest requestWrapper = null;
        if (request instanceof HttpServletRequest) {
            requestWrapper = new BodyReaderHttpServletRequestWrapper((HttpServletRequest) request);
        }
        request.setCharacterEncoding(this.encoding);
        response.setCharacterEncoding(this.encoding);
        if (requestWrapper == null) {
            chain.doFilter(request, response);
        } else {
            chain.doFilter(requestWrapper, response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) {
        this.encoding = "UTF-8";
         if (filterConfig.getInitParameter(ENCODING) != null && "".equals(filterConfig.getInitParameter(ENCODING))) {
            this.encoding = filterConfig.getInitParameter("encoding");
        }
    }
}
