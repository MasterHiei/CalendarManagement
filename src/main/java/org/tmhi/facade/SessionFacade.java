package org.tmhi.facade;

import org.tmhi.model.dto.CalendarSessionDto;
import org.tmhi.model.dto.UserSessionDto;
import org.tmhi.model.entity.UserEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Objects;

/**
 * Author:       Hiei
 * Date:         2018/04/07
 * Description:  Session相关业务处理
 * Modified By:
 */
public class SessionFacade {
    
    /** 用户信息Session名 */
    private static final String USER_SESSION_NAME = "user_session";
    /** 日历信息Session名 */
    private static final String CALENDAR_SESSION_NAME = "calendar_session";
    
    /**
     * 将用户信息存入Session
     *
     * @param request HttpServletRequest
     * @param user 用户实体
     */
    public static void saveUserSession(HttpServletRequest request, UserEntity user) {
        UserSessionDto userSessionDto = new UserSessionDto();
        userSessionDto.setUserId(user.getUserId());
        userSessionDto.setUserName(user.getUserName());
        userSessionDto.setUserAvatar(user.getUserAvatar());
        request.getSession().setAttribute(USER_SESSION_NAME, userSessionDto);
    }

    /**
     * 取出Session中保存的用户信息
     *
     * @param request HttpServletRequest
     * @return  UserSessionDto（若Session信息不存在则返回NULL）
     */
    public static UserSessionDto getUserSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (Objects.isNull(session)) {
            return null;
        }
        Object userSession = session.getAttribute(USER_SESSION_NAME);
        return Objects.isNull(userSession) ? null : (UserSessionDto) userSession;
    }

    /**
     * 将日历信息存入Session
     *
     * @param request HttpServletRequest
     * @param date 目标日期
     */
    public static void saveCalendarSession(HttpServletRequest request, LocalDate date) {
        CalendarSessionDto calendarSessionDto = new CalendarSessionDto();
        calendarSessionDto.setDate(date);
        request.getSession().setAttribute(CALENDAR_SESSION_NAME, calendarSessionDto);
    }

    /**
     * 取出Session中保存的日历信息
     *
     * @param request HttpServletRequest
     * @return  calendarSessionDto（若Session信息不存在则返回NULL）
     */
    public static CalendarSessionDto getCalendarSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (Objects.isNull(session)) {
            return null;
        }
        Object calendarSession = session.getAttribute(CALENDAR_SESSION_NAME);
        return Objects.isNull(calendarSession) ? null : (CalendarSessionDto) calendarSession;
    }
}
